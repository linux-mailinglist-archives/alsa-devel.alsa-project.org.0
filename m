Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE265A9C8
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Jan 2023 12:37:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9A035B4B;
	Sun,  1 Jan 2023 12:36:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9A035B4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672573062;
	bh=aP3z3S24TDxDZQv7zS7rbGPe85t2QA8pT/Q1rdHyEmI=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iquWwMzp/MTubSvKhXSSEZI5R3rTTxRuZrEbOAHs39syUIGPNSBDqjQjddOAYEwWh
	 8/LjeTov+LLInYxOokpox9qdKfWrg20Xiu+s9rWa5EAEN45pZeTKnXV9R6LMF0YFc8
	 xhJf8lBFlkOTxG/ueX5hF2U1jM4lA0MWLOAjRah0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B442F803DC;
	Sun,  1 Jan 2023 12:36:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01C36F802E8; Sun,  1 Jan 2023 12:36:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08DBCF800D0
 for <alsa-devel@alsa-project.org>; Sun,  1 Jan 2023 12:36:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08DBCF800D0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=ikUTO0ou
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672572991;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=uCeod2rK1eavDzGY0W5pX6FcRiXxrx4c4hZhTh6vkjk=;
 b=ikUTO0ourknMQm8iBIL9CgVqe4qOw0jKNR894UXTHze/AGw+JvFpdDIoXhAx82Fy3w
 uPW4RXz+w0ejbqCIob3b4EOdWxCsl5KhPkcEW9v8XHISIFWClXubisHhZhPG7sh2griM
 UBM9jWa2Y1amiCfSwivJz2t29NjTh4EOGdAqvJ6+9yYYyaaqwaXe+kg8dcb/6aftQCud
 tvklODam9qzLx3yrfGqViGIbOYgESwV/oEFOYxHm+V4bAyJbfhERvD3XJoVrmtO853O+
 1wAsFwZSc9AfSQyKIWdI5qZvrGyZMlCSEYhmc+A7LY0R9Xu1AcM/QU5eNt0bcsn24TGR
 vfBg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJAhdlWyvDI"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
 with ESMTPSA id Yce349z01BaUbb0
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 1 Jan 2023 12:36:30 +0100 (CET)
Date: Sun, 1 Jan 2023 12:36:24 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: Fix fallback SD line index handling
Message-ID: <Y7FwOECdeNhtGbbF@gerhold.net>
References: <20221231061545.2110253-1-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231061545.2110253-1-computersforpeace@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Brian,

On Fri, Dec 30, 2022 at 10:15:45PM -0800, Brian Norris wrote:
> These indices should reference the ID placed within the dai_driver
> array, not the indices of the array itself.
> 

Indeed, thanks for the fix and sorry for breaking IPQ8064 audio. Looks
like it's not tested very often because my patch that broke it was
merged 2.5 years ago. :-)

> This fixes commit 4ff028f6c108 ("ASoC: qcom: lpass-cpu: Make I2S SD
> lines configurable"), which among others, broke IPQ8064 audio

FWIW I think it's really just IPQ8064 audio (no others) because the
other platforms all happen to have the MI2S ports at the same index as
their ID.

> (sound/soc/qcom/lpass-ipq806x.c) because it uses ID 4 but we'd stop
> initializing the mi2s_playback_sd_mode and mi2s_capture_sd_mode arrays
> at ID 0.
> 
> Fixes: 4ff028f6c108 ("ASoC: qcom: lpass-cpu: Make I2S SD lines configurable")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

BTW I just found this patch "by accident" while looking for something
else on the stable mailing list. Please Cc the original author if you
use Fixes (get_maintainer.pl should suggest that automatically if you
run it in the kernel tree). :)

Thanks!
Stephan

> ---
>  sound/soc/qcom/lpass-cpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 54353842dc07..dbdaaa85ce48 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1037,10 +1037,11 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
>  					struct lpass_data *data)
>  {
>  	struct device_node *node;
> -	int ret, id;
> +	int ret, i, id;
>  
>  	/* Allow all channels by default for backwards compatibility */
> -	for (id = 0; id < data->variant->num_dai; id++) {
> +	for (i = 0; i < data->variant->num_dai; i++) {
> +		id = data->variant->dai_driver[i].id;
>  		data->mi2s_playback_sd_mode[id] = LPAIF_I2SCTL_MODE_8CH;
>  		data->mi2s_capture_sd_mode[id] = LPAIF_I2SCTL_MODE_8CH;
>  	}
> -- 
> 2.39.0
> 
