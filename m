Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9C36C8ED0
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Mar 2023 15:24:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86D53E12;
	Sat, 25 Mar 2023 15:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86D53E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679754279;
	bh=jiYyKGv1Gu17pWE8VnuAPHHtV3ro909OfE/D4PTJS6E=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=L4K06V47IlZlVjjyZm9gfGsbzgl8bniObv0Du9hUccHQGCMdw2wv4F/VpKryo7KR5
	 nwj96pUZjXEhu9cxnHK7lcj3NWOQm6rv6aoADevTOFYSlNfveW/GowQLT4h+bcIpRG
	 gOr1w4606AB2K76zyw+YpFECxoSWxGSt09eVY6mQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4737AF8027B;
	Sat, 25 Mar 2023 15:23:49 +0100 (CET)
To: Banajit Goswami <bgoswami@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 1/1] sound: soc: codecs: wcd-mbhc-v2: expose ALSA control
 for jack
Date: Sat, 25 Mar 2023 15:21:42 +0100
In-Reply-To: <20230325142142.24337-1-me@dylanvanassche.be>
References: <20230325142142.24337-1-me@dylanvanassche.be>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GUOPZ6ODTNNPR35HK2PTOQM5KXHVHS3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <167975422905.26.343811493761575023@mailman-core.alsa-project.org>
From: Dylan Van Assche via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Dylan Van Assche <me@dylanvanassche.be>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Dylan Van Assche <me@dylanvanassche.be>,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>,
 Caleb Connolly <caleb@connolly.tech>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A26F3F8027B; Sat, 25 Mar 2023 15:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2EBEF80093
	for <alsa-devel@alsa-project.org>; Sat, 25 Mar 2023 15:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2EBEF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=dylanvanassche.be header.i=@dylanvanassche.be
 header.a=rsa-sha256 header.s=MBO0001 header.b=uc0SbByH
Received: from smtp102.mailbox.org (unknown [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4PkLqp72BJz9slh;
	Sat, 25 Mar 2023 15:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dylanvanassche.be;
	s=MBO0001; t=1679754119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uo56ilykXnyoQsO7PNYE1eo/ncujGlXqfqKWuFiXTd8=;
	b=uc0SbByHFJBINZfPbjEbTckBFejSkmSJpqHGDy5jtIB4+pnm+eQ1Db7KlQA0eDxpslWxi8
	NDYaqBHn85hmfm+L8idgkpbZdCSosAuMA73bdQAB/RHEzPpUZTgtnjkL0Fzrc4V24iLp2q
	SwczWaznyqpXwEFbZzjfY3LOxjOFQSoEpkOTQjjVIr/0WWxGOBy0H0LVZ7J3xM+PPTDOs9
	vwMpLJzQzBeoR3OWreCifLCx+OqrC9VFVtdW773TpTOw2Z+dJsyVtcWLF7hFhJxxxvAd0l
	gx+4+G9uGu5qjdRGtxlbWVyXy+HZ+6Ra2NL6E6QxtmV+3is6LlEhRPSRl7jtLA==
From: Dylan Van Assche <me@dylanvanassche.be>
To: Banajit Goswami <bgoswami@quicinc.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 1/1] sound: soc: codecs: wcd-mbhc-v2: expose ALSA control
 for jack
Date: Sat, 25 Mar 2023 15:21:42 +0100
Message-Id: <20230325142142.24337-2-me@dylanvanassche.be>
In-Reply-To: <20230325142142.24337-1-me@dylanvanassche.be>
References: <20230325142142.24337-1-me@dylanvanassche.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GUOPZ6ODTNNPR35HK2PTOQM5KXHVHS3T
X-Message-ID-Hash: GUOPZ6ODTNNPR35HK2PTOQM5KXHVHS3T
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
 Dylan Van Assche <me@dylanvanassche.be>,
 Joel Selvaraj <joelselvaraj.oss@gmail.com>,
 Caleb Connolly <caleb@connolly.tech>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GUOPZ6ODTNNPR35HK2PTOQM5KXHVHS3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Jack detection is currently fully functional via the input
interface together with multimedia buttons, but is not exposed
as an ALSA control. Therefore, ALSA clients such as PulseAudio
do not pick up the jack detection events as they only support
one of the possible interface (ALSA control or input interface,
but not both). Expose the jack events as an ALSA control and input
interface to provide ALSA clients both interfaces.

Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
Tested-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Tested-by: Caleb Connolly <caleb@connolly.tech>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 1911750f7445..1b75f49b2858 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -725,6 +725,10 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
 
 	mutex_lock(&mbhc->lock);
 
+	ret = snd_jack_add_new_kctl(mbhc->jack->jack, "Headset Jack", WCD_MBHC_JACK_MASK);
+	if (ret)
+		dev_warn(component->dev, "failed creating Headset Jack kctl with err: %d\n", ret);
+
 	/* enable HS detection */
 	if (mbhc->mbhc_cb->hph_pull_up_control_v2)
 		mbhc->mbhc_cb->hph_pull_up_control_v2(component,
-- 
2.39.2

