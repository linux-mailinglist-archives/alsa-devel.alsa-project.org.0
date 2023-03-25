Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 378596C8ECC
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Mar 2023 15:23:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63FCFE12;
	Sat, 25 Mar 2023 15:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63FCFE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679754182;
	bh=FyZ9wWxFc9DhD+TJe4C7/wsqgo6GjP49OQ6ICKaMGAI=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=OENVb4V0csts3JooxwIDfj69dgYzguNApoGYEnXBtmjscmGs1T7+gKp88axeOQ4fA
	 9cXPTYgztHKM+yKIm5tavGZvR6qnJNM9FE08uyc9VEjn+oI88t2JpZjf1aX4Xp97/b
	 SpK0Garpl52m5/Vnb6C7YjtbH9U4y5MmtJvpwMRQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE34BF8027B;
	Sat, 25 Mar 2023 15:22:11 +0100 (CET)
To: Banajit Goswami <bgoswami@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 0/1] Expose ALSA control for jack
Date: Sat, 25 Mar 2023 15:21:41 +0100
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RCP4OZE6I4TRJGC5SMBWFV6FMAOLVLM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167975413007.26.9031193578498889790@mailman-core.alsa-project.org>
From: Dylan Van Assche via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Dylan Van Assche <me@dylanvanassche.be>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Dylan Van Assche <me@dylanvanassche.be>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25BE5F80482; Sat, 25 Mar 2023 15:22:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE67BF80254
	for <alsa-devel@alsa-project.org>; Sat, 25 Mar 2023 15:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE67BF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=dylanvanassche.be header.i=@dylanvanassche.be
 header.a=rsa-sha256 header.s=MBO0001 header.b=LlaPYFY/
Received: from smtp102.mailbox.org (unknown [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4PkLqk6CLDz9skg;
	Sat, 25 Mar 2023 15:21:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
	s=MBO0001; t=1679754114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5LSD+kez1XFmSv8Jj3qsqV+B5Ky+NhkoeQXRmyAN+C8=;
	b=LlaPYFY/XzKeNCixql9e3nZ3izQsmtt1VFVsZp2RVNXp7PkndmL3smCH/tl8JQuOBNTG0V
	gO/L3O7yLAj53pg+B4c6uF5HTLlPLws+MlTOBBIObhqv94BzeCTlBaMeFtMb6z/Niko/6b
	v6QIxUTbNEdJ8cqAHN8mTyyCdbVn1N0D5EMpIh7UZb6T2na5FxvQhqiCjv/9e+mTtTALom
	J/M0WIccM+HoAcbrkMSGDSl7FQBm+x+ByMQftjxnbM4UHY2b/ZRyxO0JlJjwwMwIU0aVmS
	V0/DtYxPJ9tYNoJeL3vtpqeI0Im1pDZxVGbTFiPBkW9y0Cl+2sk/nIgAHId+EA==
From: Dylan Van Assche <me@dylanvanassche.be>
To: Banajit Goswami <bgoswami@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 0/1] Expose ALSA control for jack
Date: Sat, 25 Mar 2023 15:21:41 +0100
Message-Id: <20230325142142.24337-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2RCP4OZE6I4TRJGC5SMBWFV6FMAOLVLM
X-Message-ID-Hash: 2RCP4OZE6I4TRJGC5SMBWFV6FMAOLVLM
X-MailFrom: me@dylanvanassche.be
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Dylan Van Assche <me@dylanvanassche.be>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RCP4OZE6I4TRJGC5SMBWFV6FMAOLVLM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Qualcomm SDM845 features a headphone jack via a Qualcomm WCD9340
codec which has jack detection through the wcd-mbhc-v2 driver.

ALSA features 2 ways to expose jack detection from the kernel to
userspace either as an input device or through an ALSA control.
The wcd-mbhc-v2 driver only supports the first option which is
insufficient for userspace programs e.g. PulseAudio [1].
Therefore, ALSA clients such as PulseAudio do not pick up the 
jack detection events as they only support one of the possible 
interface (ALSA control or input interface, but not both). 
Expose the jack events as an ALSA control and input interface 
to provide ALSA clients both interfaces.

[1] https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1377

Changes in v3:

- Improved cover letter
- Added Tested-by from
https://lore.kernel.org/alsa-devel/20221007155716.10594-1-me@dylanvanassche.be/
- Properly added maintainers for sending this patch

Kind regards,
Dylan Van Assche

Dylan Van Assche (1):
  sound: soc: codecs: wcd-mbhc-v2: expose ALSA control for jack

 sound/soc/codecs/wcd-mbhc-v2.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.39.2

