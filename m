Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 302AE89849D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B25E2CA5;
	Thu,  4 Apr 2024 12:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B25E2CA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225094;
	bh=/6bHgOjJBJyV98vE/wprMwW6DUyEX0wYBugNwx5yRmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tXKRnDG44FFd/ifLguoImLgo58DdaeqmpyuXcvUy7OGll02aUOcCNaHuGTcudkSXA
	 U5Jc9FZdj9DAsK3nLwcQS1Ub0pW0Ult6JOqCh5eRtbKz3hWCeyNT24imjF94taB9wI
	 mJG+bxMUc1YINk0jFR0uy41Qw8sZZO//4jbLcAbw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0342F8064C; Thu,  4 Apr 2024 12:03:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DADDDF80571;
	Thu,  4 Apr 2024 12:03:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF336F80578; Thu,  4 Apr 2024 12:03:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DRUGS_ERECTILE,DRUGS_ERECTILE_OBFU,
	FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E323F805D6
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E323F805D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=b8TvTxQh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224976; x=1712829776;
	i=oswald.buddenhagen@gmx.de;
	bh=QbpXbcE+ZR9RSM7KyHuCqE1u/L252UQLp182kXonEls=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=b8TvTxQhpjTEGzmfTUShuAzbJg/IwGiP/UVfTNkrDMSOAV4nMQdbI/MZV9KNbueW
	 JvX/B+gQRtO+/Bsf+RNoQHBRNXeBWJkBOfAKdnMZHfNuQJfAbPAcTZkj65X+pMOXb
	 YFzfV2pRGCi8ADWwSymtEDDwyOxdeNLnScP+3AUMwo0W9mf4jh6VvJx0Zk62ed7LB
	 vIeRrQf7YB1T4uqCN6bikzaOBXMFHyvMTYOTXo4HYHxgoDAGIsDZhPvNQx6tgylwX
	 fjtj6N8ANMgGiElIcv+0jUY0urgm/gNPkU8w6pTmyQorvYDjpSZEGZBUwuTWkTvfk
	 8fmKyrJVn4g91u5RvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuUnK-1sidIw1KhG-00rcU6; Thu, 04
 Apr 2024 12:02:56 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RG6-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 14/17] ALSA: emu10k1: improve cache behavior documentation
Date: Thu,  4 Apr 2024 12:00:45 +0200
Message-ID: <20240404100048.819674-15-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RShzJIdSN/XlrC4KSiDVgiWyWCtZzJvQ0gURYuFuabSmrSjofsX
 FsugpTaIxRckDnwwYLIPee4D8UFC6jTe/srTByo+KHysrpNarJkbQNPo33IQuxo3uzuvdpf
 dw1Ni0rGGd6tcbIzZTEzjeIPkyE78K7QMHp9rztY+tmApKrVzdfNgd8K8LgWFoRJO2lCC+R
 RC/ituEkvKenSNVJ5L/ZQ==
UI-OutboundReport: notjunk:1;M01:P0:Fkc+a9lB7nI=;lr4vL+bbJFahDVn2bm0KthnkRcs
 OgJsf27u1dvb4W/2k7EguCdl0dV5LMRDqsNqLCyFyx4XUuWS/+CEKWfwZIzr22L+aIg8hGdZO
 SeBGRs5qCHDSQy6vsGSwo1f3OzH81m2udyp++Uaa3VXe2yXsl4mGav4WMpHH2F+/9jlQ3xbru
 qmkUHEuT7nqdrHdHfThB6uB9ngyJ5DKzhZaxw1xjrExjFUZErYQTO3uvLiuandlk2cnytL38g
 rroTpnNOWbBBLbbBYj0cXouCP0VD+FS/TvuT5p87Kn/pCzD/qfoAs01Qz1MKe+ZgKUPPaxo7n
 6JxtGOkhOBu2/5i+JmjNoccvJ23vFA8FpqtFIpY23FIdsIyGcMIUJrFAugMAxadVBvBuS9Ehc
 A6jxJ98L6jItdJ6F+qW7Zo0Q0oRLesWJCNQ41/iSR2VEc/t0Pv9USRAeV0tnfekuP29A6mrEB
 s+HpXTTPW3lp1Ohzh77DVOzDafJxM1pLKsoMNp0A1qD+c7NXMrqvKRwq0CAQDYOpXY+aXIwG9
 vFwVxTDk6IWcfUW1C0PsyhzWnBChQn69/82qxyXBWUV2Y6nwtZle9alBidmHk/hXPkmm5DbIa
 TBS55ndbyU8+3+G+b3sUqM7bgTUD6CF7erPjHSJj5PxaXmIgEQl0HEoQlZpiNSbYl7UYmiVa0
 CO7B6GeNlclSaFjfsAaorFKV8w/Q/XrgoE2KwkQ2Pf69Mw8C1ElNjHHBoxhVt8M8RUgV/tPri
 8gg6tKy1Mi7dM8fx+W4HOyu/QcMRdm/nL9HutJDYy2t8h7hnBRLRjFBsTsgD6rnPvOsd4MtGd
 JABWuE/UkOdwPRh3Yh+p0YOVNlU/v67ZVQcLgeVrIrZKc=
Message-ID-Hash: GKYF32YZCO6QDMPFPL7GQCXNNWYQUYXI
X-Message-ID-Hash: GKYF32YZCO6QDMPFPL7GQCXNNWYQUYXI
X-MailFrom: oswald.buddenhagen@gmx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKYF32YZCO6QDMPFPL7GQCXNNWYQUYXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Resulting from more reverse engineering in the course of debugging.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 include/sound/emu10k1.h | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 9e3bd4f81460..12c7dc760724 100644
=2D-- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -598,17 +598,25 @@ SUB_REG(PEFE, FILTERAMOUNT,	0x000000ff)	/* Filter en=
vlope amount				*/
 // In stereo mode, the two channels' caches are concatenated into one,
 // and hold the interleaved frames.
 // The cache holds 64 frames, so the upper half is not used in 8-bit mode=
.
-// All registers mentioned below count in frames.
-// The cache is a ring buffer; CCR_READADDRESS operates modulo 64.
-// The cache is filled from (CCCA_CURRADDR - CCR_CACHEINVALIDSIZE)
-// into (CCR_READADDRESS - CCR_CACHEINVALIDSIZE).
+// All registers mentioned below count in frames. Shortcuts:
+//   CA =3D CCCA_CURRADDR, CRA =3D CCR_READADDRESS,
+//   CLA =3D CCR_CACHELOOPADDRHI:CLP_CACHELOOPADDR,
+//   CIS =3D CCR_CACHEINVALIDSIZE, LIS =3D CCR_LOOPINVALSIZE,
+//   CLF =3D CCR_CACHELOOPFLAG, LF =3D CCR_LOOPFLAG
+// The cache is a ring buffer; CRA operates modulo 64.
+// The cache is filled from (CA - CIS) into (CRA - CIS).
 // The engine has a fetch threshold of 32 bytes, so it tries to keep
-// CCR_CACHEINVALIDSIZE below 8 (16-bit stereo), 16 (16-bit mono,
-// 8-bit stereo), or 32 (8-bit mono). The actual transfers are pretty
-// unpredictable, especially if several voices are running.
-// Frames are consumed at CCR_READADDRESS, which is incremented afterward=
s,
-// along with CCCA_CURRADDR and CCR_CACHEINVALIDSIZE. This implies that t=
he
-// actual playback position always lags CCCA_CURRADDR by exactly 64 frame=
s.
+// CIS below 8 (16-bit stereo), 16 (16-bit mono, 8-bit stereo), or
+// 32 (8-bit mono). The actual transfers are pretty unpredictable,
+// especially if several voices are running.
+// Frames are consumed at CRA, which is incremented afterwards,
+// along with CA and CIS. This implies that the actual playback
+// position always lags CA by exactly 64 frames.
+// When CA reaches DSL_LOOPENDADDR, LF is set for one frame's time.
+// LF's rising edge causes the current values of CA and CIS to be
+// copied into CLA and LIS, resp., and CLF to be set.
+// If CLF is set, the first LIS of the CIS frames are instead
+// filled from (CLA - LIS), and CLF is subsequently reset.
 #define CD0			0x20		/* Cache data registers 0 .. 0x1f			*/

 #define PTB			0x40		/* Page table base register				*/
=2D-
2.42.0.419.g70bf8a5751

