Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591B722B601
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 20:45:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F10781681;
	Thu, 23 Jul 2020 20:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F10781681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595529956;
	bh=l13iX/k63EVgwWG5OsvwW6cFWfuWjY2UHoS6a7QzOuQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q7Qbcq5mBHvjig+Jr07Rz9fMrmrlUJCCCY+b1FobXs1OKgB1LXE4duy0yI7M2sF/B
	 XcC9SDKm3ztfBu5oZxEWoeBHaLfkpYobgIgKejiwrmU25k4sQSofKjhTlLSVWW5SeY
	 riZ1RN33ORLIhTDUooTcwD0WcI++fEfSE3LNTFe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28CDDF80268;
	Thu, 23 Jul 2020 20:44:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25A98F80212; Thu, 23 Jul 2020 20:44:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D806AF8011F
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 20:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D806AF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="XQX02bTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595529883;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ZBGeT5meaENGUkHBjaTnLB8Wyc3JbNoxdGt3rTZZJuE=;
 b=XQX02bTL9X0bVFPOAxK9t0oXsX61bOpvyP1grblyHsw08+cGqoCITQIgEo/p4a/GmD
 topcUO805HGkg+8x0oLl+Dqvm3FW+tl3wvejZfWYamaTWAXGTxwojGpjLpZVN56TphL9
 +QnDUP0g3wDC2Pp7kCgFpK9+LeUiiFXuMvhliKTIK8SM9XNYwqQOaxpEXX4KIe5O8mCS
 vS35uugaxUiPw/nBXelftxE/qnA069u1x6DJiWlghI4pAzz3i5qp1daLKbtRQrCLZ5kL
 FrFX9lqHQ+13Nu/02dPpUKvUif3bnurHQcMqN4TgDPJ8S36uVppbqOyp1lfai+1ZPMHb
 CJ5Q==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IczHboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew6NIif5J4
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 23 Jul 2020 20:44:41 +0200 (CEST)
Date: Thu, 23 Jul 2020 20:44:36 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
Message-ID: <20200723184432.GA321518@gerhold.net>
References: <20200721104422.369368-1-cychiang@chromium.org>
 <20200721104422.369368-3-cychiang@chromium.org>
 <ce029818-5082-643b-ff63-25aafea3de6c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce029818-5082-643b-ff63-25aafea3de6c@linaro.org>
Cc: Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dianders@chromium.org,
 Ajit Pandey <ajitp@codeaurora.org>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
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

On Wed, Jul 22, 2020 at 10:25:14AM +0100, Srinivas Kandagatla wrote:
> > +static int sc7180_parse_of(struct snd_soc_card *card)
> > +{
> 
> This code is getting duplicated in various places like apq8016_sbc_parse_of,
> it will be nice to common this up, if possible!
> 

FYI, I started work on making apq8016_sbc use qcom_snd_parse_of()
a while ago already, but didn't find the time to finish it up.
I have now sent it, this should make it possible to use the common
qcom_snd_parse_of() function in this driver as well.

See: https://lore.kernel.org/alsa-devel/20200723183904.321040-1-stephan@gerhold.net/

Stephan

