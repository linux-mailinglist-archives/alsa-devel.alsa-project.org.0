Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D07512AAF
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 06:47:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FA86820;
	Thu, 28 Apr 2022 06:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FA86820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651121240;
	bh=56/yka3H2tB7UjGHqPX68PN+LLhFAQcRuTg7FuvB2pg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a0f9xrFfstPzkeYAAVPHejzqnSTLWrdaqJuxxUJ6gWH3rC2osK6jWAe7pZ6ic86VK
	 gS2jBntmvrh9wNIxTWwWOcSCoYTZM3uOy8XCEuNHWQd3CgeuQOw2vr2cNQIzs1MkGh
	 ggevXcmRWiLQEtYhfkhj/jARtCA3xUdi+UoHEvQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 106D8F800AE;
	Thu, 28 Apr 2022 06:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1FBDF8016E; Thu, 28 Apr 2022 06:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A65F9F8012B
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 06:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A65F9F8012B
Received: from fsav117.sakura.ne.jp (fsav117.sakura.ne.jp [27.133.134.244])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 23S4iiUx031241;
 Thu, 28 Apr 2022 13:44:44 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav117.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav117.sakura.ne.jp);
 Thu, 28 Apr 2022 13:44:44 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav117.sakura.ne.jp)
Received: from [192.168.1.2] (125.90.232.153.ap.dti.ne.jp [153.232.90.125])
 (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 23S4ihJD031236
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 28 Apr 2022 13:44:43 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Message-ID: <d2d0ac77-e8bc-dd69-0a8a-470e42276d8c@katsuster.net>
Date: Thu, 28 Apr 2022 13:44:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ASoC: rk3328: fix disabling mclk on pclk probe failure
Content-Language: en-US
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20220427172310.138638-1-frattaroli.nicolas@gmail.com>
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
In-Reply-To: <20220427172310.138638-1-frattaroli.nicolas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Nicolas,

Oh, indeed. Thanks for fix.

Reviewed-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>


On 2022/04/28 2:23, Nicolas Frattaroli wrote:
> If preparing/enabling the pclk fails, the probe function should
> unprepare and disable the previously prepared and enabled mclk,
> which it doesn't do. This commit rectifies this.
> 
> Fixes: c32759035ad2 ("ASoC: rockchip: support ACODEC for rk3328")
> Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
> ---
>   sound/soc/codecs/rk3328_codec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
> index 758d439e8c7a..86b679cf7aef 100644
> --- a/sound/soc/codecs/rk3328_codec.c
> +++ b/sound/soc/codecs/rk3328_codec.c
> @@ -481,7 +481,7 @@ static int rk3328_platform_probe(struct platform_device *pdev)
>   	ret = clk_prepare_enable(rk3328->pclk);
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "failed to enable acodec pclk\n");
> -		return ret;
> +		goto err_unprepare_mclk;
>   	}
>   
>   	base = devm_platform_ioremap_resource(pdev, 0);

