Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A391730D6F5
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 11:02:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2956516E4;
	Wed,  3 Feb 2021 11:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2956516E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612346562;
	bh=Zq0QvqSM6RTPfvQAbAKtyx9cLc4E9N1yGT2Vh9eMk28=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=syqdXlbd4Eb0DT18RcdvClLBnGz5Akpd4yivLuoXDk0XBXYBREk8fKnepuZKNI0qA
	 qV8GaA09/gKwTYY38qLnOhmBUPo51C0scZcWtVWKfIEmcoZRZvZPLWXiGV7mbiKfPL
	 AxIMfWM6/Wf4aAbVNB/6TPTbuxqY8nJ4v9t5tOKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91DAEF80156;
	Wed,  3 Feb 2021 11:01:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C120F8015A; Wed,  3 Feb 2021 11:01:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7908F80154
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 11:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7908F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="QRFtyKBW"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601a74530003>; Wed, 03 Feb 2021 02:00:51 -0800
Received: from [10.26.73.224] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Feb
 2021 10:00:48 +0000
Subject: Re: [PATCH v2 5/9] arm64: defconfig: Enable RT5659
To: Sameer Pujar <spujar@nvidia.com>, <thierry.reding@gmail.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>, <lgirdwood@gmail.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
 <1611944866-29373-6-git-send-email-spujar@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3d0aa7e4-9c9e-38a0-7cff-d86009b9266b@nvidia.com>
Date: Wed, 3 Feb 2021 10:00:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1611944866-29373-6-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612346451; bh=Zm6eAFzmy5jCUF8zdukXzNtqTTnjEePWswJsRjm9IPg=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=QRFtyKBWB9Jqwvm2v8PbDaYUm7fs3hNnYaMFwt1GUk0en/9nJgrESDwqV8hJYWLQ/
 gOvOefAkfpp1WBRL2agcSHkcqdbvQQucDQeb/iZqhzWkAmY6vcdMxm7IIoj4oS8JZo
 76dPFpXwPVXLNjvISSh704k2yUamtyRygmAFO4MwYlo+m/uB9XahkKuWs8z/Tg04om
 4zesNHGTLUpHFrgjtOgnNmot18L4pzi2Xu2w0sYIcu5ONnvOOOqNa5wN7BP8xvRU4y
 2jx4v3AZR+vY+BxFNi0Dbsu90ZTqkUl5In9T0a5uKumb+nxUN9j5timObv5ypSObfL
 MEpWu4cFi2JEQ==
Cc: Oder Chiou <oder_chiou@realtek.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 sharadg@nvidia.com, linux-tegra@vger.kernel.org,
 Bard Liao <bardliao@realtek.com>
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


On 29/01/2021 18:27, Sameer Pujar wrote:
> Enable the RT5659 audio codec driver.

We could add that the Jetson AGX Xavier uses this codec and so we want
to enable this for testing purposes. Otherwise ...

> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Oder Chiou <oder_chiou@realtek.com>
> Cc: Bard Liao <bardliao@realtek.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index ec377f7..ea279e8 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -754,6 +754,7 @@ CONFIG_SND_SOC_ES7134=m
>  CONFIG_SND_SOC_ES7241=m
>  CONFIG_SND_SOC_GTM601=m
>  CONFIG_SND_SOC_PCM3168A_I2C=m
> +CONFIG_SND_SOC_RT5659=m
>  CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
>  CONFIG_SND_SOC_TAS571X=m
>  CONFIG_SND_SOC_WCD934X=m
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
