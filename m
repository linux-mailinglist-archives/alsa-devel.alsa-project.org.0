Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF5D2FB57E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 11:57:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E24B1887;
	Tue, 19 Jan 2021 11:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E24B1887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611053863;
	bh=IuFjz0dhSeLpghs99Y3MR46yXCo/6z+KhoZZlSo/rZs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NN2CyCB2fYAyCcjjAtdslROM/UJKCgThzxwRfZZRnRIW1kXaYhd4XHHaG9kITqLnV
	 mPShOSsnYzW9qp0uc489HA9HMrfnOd5VQ7KgzJlUEGtrN37cCv4rO7QUVUfyGYlclB
	 z7e89aZopMmShcllwu1v5LfBe7QvBDq2Hk6HUJqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ABFAF8026A;
	Tue, 19 Jan 2021 11:56:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B18B5F80257; Tue, 19 Jan 2021 11:56:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90B56F80117
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 11:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B56F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="cZweJB9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611053763;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:From:
 Subject:Sender;
 bh=Rv61Um1d4FAKciw1OVSLbZ2ZbyY9rCTN0LhE6dc1i/4=;
 b=cZweJB9RxInf/6Qa8lg9Azdsz/JR7aUNl9ybFWVNCFb0bmbUnTxdxvNWy0FGhaYbGh
 MAu1HmT0wlBV4XZVUXksGLLCtnwJBhzZvkvK+o51/4kCCrN8AhIzPIbiAAIuc+1xzG+H
 ipOjly/uoFszELJa6PDvkXn7sHYqchrtW0OC7I0OF7cyVwISGueEOv6F+f/6Pegc2+AK
 LWejTFNjF6YBGlZZoR9xP5CRAmhfZaAmGsUaMdVlOMq5p0l1rXeuuQopOCjxUxC5or/e
 AvLWRXbkX7bIHqwQLBmI2bcjMfgQTkWOWUTlmv4dd7T+PPrqPl4532Gb4+nZk+AEq0+3
 LUHA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic3ABg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id R0a218x0JAu2CPR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 19 Jan 2021 11:56:02 +0100 (CET)
Date: Tue, 19 Jan 2021 11:55:56 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/2] ASoC: qcom: Fix broken support to MI2S TERTIARY and
 QUATERNARY
Message-ID: <YAa6vCPGZXxqXXao@gerhold.net>
References: <20210118164509.32307-1-srinivas.kandagatla@linaro.org>
 <20210118164509.32307-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118164509.32307-3-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 srivasam@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org,
 Jun Nie <jun.nie@linaro.org>
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

Hi Srinivas,

Thanks a lot for the patch!

On Mon, Jan 18, 2021 at 04:45:09PM +0000, Srinivas Kandagatla wrote:
> lpass hdmi support patch totally removed support for MI2S TERTIARY
> and QUATERNARY.
> 
> One of the major issue was spotted with the design of having
> separate SoC specific header files for the common lpass driver.
> This design is prone to break as an when new SoC header is added
> as the common DAI ids of other SoCs will be overwritten by the
> new ones.
> 
> Having a common header qcom,lpass.h should fix the issue and any new
> DAI ids should be added to the common header.
> 
> With this change lpass also needs a new of_xlate function to resolve
> dai name.
> 
> Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
> Reported-by: Jun Nie <jun.nie@linaro.org>
> Reported-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

For some reason this does not seem to apply to asoc/for-next or
asoc/for-linus:

Applying: ASoC: qcom: Fix broken support to MI2S TERTIARY and QUATERNARY
error: patch failed: sound/soc/qcom/lpass-platform.c:519
error: sound/soc/qcom/lpass-platform.c: patch does not apply
Patch failed at 0001 ASoC: qcom: Fix broken support to MI2S TERTIARY and QUATERNARY

Can you check if you need to rebase this patch?
Also small comment below in case you re-send:

> ---
>  sound/soc/qcom/lpass-cpu.c      | 22 ++++++++++++++++++++++
>  sound/soc/qcom/lpass-platform.c | 12 ++++++++++++
>  sound/soc/qcom/lpass-sc7180.c   |  6 +++---
>  sound/soc/qcom/lpass.h          |  2 +-
>  4 files changed, 38 insertions(+), 4 deletions(-)
> 
> [...]
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index 85db650c2169..eff5de918e3a 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -20,7 +20,7 @@
>  #include "lpass.h"
>  
>  static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
> -	[MI2S_PRIMARY] = {
> +	[0] = {
>  		.id = MI2S_PRIMARY,
>  		.name = "Primary MI2S",
>  		.playback = {
> @@ -46,7 +46,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
>  		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
>  	},
>  
> -	[MI2S_SECONDARY] = {
> +	[1] = {
>  		.id = MI2S_SECONDARY,
>  		.name = "Secondary MI2S",
>  		.playback = {
> @@ -61,7 +61,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
>  		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
>  		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
>  	},
> -	[LPASS_DP_RX] = {
> +	[2] = {
>  		.id = LPASS_DP_RX,
>  		.name = "Hdmi",
>  		.playback = {

Specifying the indexes here explicitly seems pointless now,
perhaps change this to just

	{
		.id = MI2S_PRIMARY,
		/* ... */
	},
	{
		.id = MI2S_SECONDARY,
		/* ... */
	}

Thanks,
Stephan
