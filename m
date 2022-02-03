Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC074AC190
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 15:46:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7D31816;
	Mon,  7 Feb 2022 15:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7D31816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644245190;
	bh=ftaBg70Fywe23xPOkzO2k/1SUWqJcEF9h7huEHsLFR4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S2BvMBjlB/n4p5HPEvK6O5VyE87RHg9MTSgujaY12TexG+J6CT0OpNagtFjPR28Bk
	 zy2Y2qL3W+Sp6uJBhwl2B4ZkdD3bdYLQauS6MhiTq2U/OKncdocOlmtyYR0Qa6nOgp
	 YBFN6u+7CWhqKF1J+xL6xZo+LMk4Aok6m+aURm5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46973F80246;
	Mon,  7 Feb 2022 15:45:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93B9FF8027C; Thu,  3 Feb 2022 10:22:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EFCAF80082
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 10:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EFCAF80082
Received: from localhost (localhost [127.0.0.1])
 by comms.puri.sm (Postfix) with ESMTP id 2FD6DDFAB9;
 Thu,  3 Feb 2022 01:21:33 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGQv4tBnuPp7; Thu,  3 Feb 2022 01:21:32 -0800 (PST)
Message-ID: <77418b2bac0c91002488f126db5a9d5b79416782.camel@puri.sm>
Subject: Re: [PATCH] ASoC: wm8962: Allow switching between analog and
 digital inputs
From: Martin Kepplinger <martin.kepplinger@puri.sm>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Date: Thu, 03 Feb 2022 10:21:28 +0100
In-Reply-To: <20220202164545.30457-1-ckeepax@opensource.cirrus.com>
References: <20220202164545.30457-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 07 Feb 2022 15:45:23 +0100
Cc: patches@opensource.cirrus.com, shengjiu.wang@nxp.com, daniel.baluta@nxp.com,
 lgirdwood@gmail.com, alsa-devel@alsa-project.org
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

Am Mittwoch, dem 02.02.2022 um 16:45 +0000 schrieb Charles Keepax:
> When the DMIC_ENA bit is set the analogue inputs are disconnected
> from
> the digital core of the chip, in favour of the digital microphones.
> Currently the driver will always enable DMIC_ENA whilst the GPIOs are
> configured for the DMIC function, this means the user can't currently
> use both the analog inputs and the digital inputs in one system.
> 
> Add an additional DAPM mutex that allows switching between analog and
> digital inputs into the digital core.
> 
> Reported-by: Martin Kepplinger <martin.kepplinger@puri.sm>

Hi Charles, thank you again very much for this! You can make this

Reported-and-tested-by: Martin Kepplinger <martin.kepplinger@puri.sm>


> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/codecs/wm8962.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index a5584ba962dcf..2c41d31956aa8 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -2049,6 +2049,13 @@ static SOC_ENUM_SINGLE_DECL(hpoutl_enum,
>  static const struct snd_kcontrol_new hpoutl_mux =
>         SOC_DAPM_ENUM("HPOUTL Mux", hpoutl_enum);
>  
> +static const char * const input_mode_text[] = { "Analog", "Digital"
> };
> +
> +static SOC_ENUM_SINGLE_VIRT_DECL(input_mode_enum, input_mode_text);
> +
> +static const struct snd_kcontrol_new input_mode_mux =
> +       SOC_DAPM_ENUM("Input Mode", input_mode_enum);
> +
>  static const struct snd_kcontrol_new inpgal[] = {
>  SOC_DAPM_SINGLE("IN1L Switch", WM8962_LEFT_INPUT_PGA_CONTROL, 3, 1,
> 0),
>  SOC_DAPM_SINGLE("IN2L Switch", WM8962_LEFT_INPUT_PGA_CONTROL, 2, 1,
> 0),
> @@ -2147,6 +2154,9 @@ SND_SOC_DAPM_MIXER("MIXINR", WM8962_PWR_MGMT_1,
> 4, 0,
>  
>  SND_SOC_DAPM_AIF_IN("DMIC_ENA", NULL, 0, WM8962_PWR_MGMT_1, 10, 0),
>  
> +SND_SOC_DAPM_MUX("Input Mode L", SND_SOC_NOPM, 0, 0,
> &input_mode_mux),
> +SND_SOC_DAPM_MUX("Input Mode R", SND_SOC_NOPM, 0, 0,
> &input_mode_mux),
> +
>  SND_SOC_DAPM_ADC("ADCL", "Capture", WM8962_PWR_MGMT_1, 3, 0),
>  SND_SOC_DAPM_ADC("ADCR", "Capture", WM8962_PWR_MGMT_1, 2, 0),
>  
> @@ -2226,16 +2236,19 @@ static const struct snd_soc_dapm_route
> wm8962_intercon[] = {
>  
>         { "DMIC_ENA", NULL, "DMICDAT" },
>  
> +       { "Input Mode L", "Analog", "MIXINL" },
> +       { "Input Mode L", "Digital", "DMIC_ENA" },
> +       { "Input Mode R", "Analog", "MIXINR" },
> +       { "Input Mode R", "Digital", "DMIC_ENA" },
> +
>         { "ADCL", NULL, "SYSCLK" },
>         { "ADCL", NULL, "TOCLK" },
> -       { "ADCL", NULL, "MIXINL" },
> -       { "ADCL", NULL, "DMIC_ENA" },
> +       { "ADCL", NULL, "Input Mode L" },
>         { "ADCL", NULL, "DSP2" },
>  
>         { "ADCR", NULL, "SYSCLK" },
>         { "ADCR", NULL, "TOCLK" },
> -       { "ADCR", NULL, "MIXINR" },
> -       { "ADCR", NULL, "DMIC_ENA" },
> +       { "ADCR", NULL, "Input Mode R" },
>         { "ADCR", NULL, "DSP2" },
>  
>         { "STL", "Left", "ADCL" },


