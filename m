Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D76F430E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 May 2023 13:51:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 799F31635;
	Tue,  2 May 2023 13:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 799F31635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683028302;
	bh=Q+aRWQ+uCvu2rsfMAW1uk5HkGazeuSRGy4KmwRmbapc=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=X/CTN3BVudSOHsHzlyUyTbDgqHKrF9PIbDRMIMBO1tIlAiS4bujmQqzDgShX5jEUT
	 AlRUbQrOfPPfzXkPcroSRn+w5HYFvMhhyzlmQlcEsHCJ4WJ2yuwduRqeV1gtpeAapV
	 crR3ViiWDFiSMHq1HLcpRdEZn+p/5sSAOoDI/s2Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2394F8051B;
	Tue,  2 May 2023 13:50:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60D18F804FE; Tue,  2 May 2023 13:50:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B18DAF800EC
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 13:50:38 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2DD9911E2;
	Tue,  2 May 2023 13:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2DD9911E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683028237; bh=hNMMZ7rTL8zILNtrnqVRLn+Oxi0X0ejwRP/9io1CcyQ=;
	h=From:To:Cc:Subject:Date:From;
	b=XMyobN/POJgyRkZpmyF8dxV6D4wFAzLPGzCkqUj1GegXXmaCeXXSqO5t3CQSXmiUP
	 BavL6gUWNCF6bPaZWfPEA0h8PVPBDXTQe23URzlwXB5Nlhmnvsv4ENJ9GUzbGE2PTG
	 DT2aaqDiTF/J+smPQr40kjPrfGWbz068m4J8MRuc=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  2 May 2023 13:50:35 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH alsa-lib 0/4] pcm: hw: implement explicit silencing for
 snd_pcm_drain
Date: Tue,  2 May 2023 13:50:06 +0200
Message-Id: <20230502115010.986325-1-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PN3S4LXFZFCW7Z6AJXLLBVBVOD7VDT55
X-Message-ID-Hash: PN3S4LXFZFCW7Z6AJXLLBVBVOD7VDT55
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PN3S4LXFZFCW7Z6AJXLLBVBVOD7VDT55/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a complete API solution for the filling of the silence samples
for the drain operation. The default bahaviour is to aligns the valid
samples to one period with extra silence samples for next 1/10th of second.

Introduce SNDRV_PCM_INFO_PERFECT_DRAIN and SNDRV_PCM_HW_PARAMS_NO_DRAIN_SILENCE
flags to fully control the filling of the silence samples in the snd_pcm_drain
call. Those flags do the bidirectional setup for this operation, so the
silencing may be implemented eventually in the kernel space when there's
a demand in future. Also, some applications may not require to silence the
samples beyond the tail of the ring buffer at all.

There is also a new pcm_hw plugin configuration field allowing the 
overwrite of the default (auto) behaviour.

Related: https://lore.kernel.org/alsa-devel/20230420113324.877164-2-oswald.buddenhagen@gmx.de/
Related: https://lore.kernel.org/alsa-devel/20230405201219.2197789-2-oswald.buddenhagen@gmx.de/

Jaroslav Kysela (4):
  pcm: hw: setup explicit silencing for snd_pcm_drain by default
  pcm: hw: add drain_silence configuration keyword
  pcm: hw: introduce SNDRV_PCM_INFO_PERFECT_DRAIN
  pcm: hw: introduce SNDRV_PCM_HW_PARAMS_DRAIN_SILENCE

 include/pcm.h               |  1 +
 include/sound/uapi/asound.h |  4 ++
 src/pcm/pcm.c               | 88 +++++++++++++++++++++++++++++++------
 src/pcm/pcm_hw.c            | 74 ++++++++++++++++++++++++++++++-
 src/pcm/pcm_local.h         |  7 +++
 5 files changed, 160 insertions(+), 14 deletions(-)

-- 
2.39.2

