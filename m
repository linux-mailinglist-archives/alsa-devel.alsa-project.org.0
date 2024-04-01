Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 149A0893ADA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 14:22:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0950722CE;
	Mon,  1 Apr 2024 14:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0950722CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711974132;
	bh=/6bHgOjJBJyV98vE/wprMwW6DUyEX0wYBugNwx5yRmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mAaU2/snabooAYhW43ZRD0WW/LfU6cmK+trv2At9vu5ZUJHW095LoWbJuDrINc9cn
	 ggNC1o+WChy1WwaofWNl8v1HBsn3oTZLEBrTTx8IKcsMP5eD2INFFPiI120sUa2Gbr
	 yqIOtE1eB4WGoHn2m4GgLHOYYlRmixHOHZI+rx0g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8891F805B5; Mon,  1 Apr 2024 14:21:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E838F805AB;
	Mon,  1 Apr 2024 14:21:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C040F8056F; Mon,  1 Apr 2024 14:21:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DRUGS_ERECTILE,DRUGS_ERECTILE_OBFU,
	FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03265F8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 14:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03265F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=jZhKQ8iY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711974088; x=1712578888;
	i=oswald.buddenhagen@gmx.de;
	bh=QbpXbcE+ZR9RSM7KyHuCqE1u/L252UQLp182kXonEls=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=jZhKQ8iYcgndnOMQRqK5GKKjbqg9B8qZpBe3rX2e3MbckIj9z6/nIw+lS0HH/sqC
	 C7YGIaMMPXl+5lKbVtA0a6aaCvSnw8c9cYFMid6xFazcVKWVdwJ+v75aR/6sRFQzi
	 pasKwNR+Mfhw/rvlbPRNZESt9QBJr1fZuWqIuCIXpE1/zfQNkKU08SvGFlHXA0hqI
	 xvhRHu8ThP9HEgbjUu+GZLXHDslB8TLbADVMYApt3Jz+iEBnfXbcb/lsBAFlk/7J9
	 rfm/K+zvrIeGjQh9+/OmT5o6avTj1H5mS4fGBqP40EkgoTctv1EkyAGq4cLlJo92i
	 uT9e+4LemWRFfe2Rpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDhlV-1s0qv23tI7-00AqBW; Mon, 01
 Apr 2024 14:21:28 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7f2-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 16/18] ALSA: emu10k1: improve cache behavior documentation
Date: Mon,  1 Apr 2024 12:07:40 +0200
Message-ID: <20240401100742.506001-17-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LcO2aHQ3NFprCOFU7uoh57T1ky1K3X/E1yL5oommICcvANdg4LN
 G+5pXjjKo+SCt8YCbOb4psR8Ars2JIi8nQ933Qb1l3gMrmBxpw5I/7HXKiGzeScS5pxURXi
 plLLg38DAU3R0Mxw0GCYg3OX7si7bO1zCvxfJCHrNO4LVXrglFBzzJvNK+Gb37U09hiDreD
 NTbpZBVz2sFl13NMW7jTg==
UI-OutboundReport: notjunk:1;M01:P0:ci4kz/pjyIs=;4kp+df/TufPnJrV6yigLfX0oEnq
 K/5zdN701ZNFDRbAuMsZF4tjg8VDyQMOdn8B6ms7EdPaaqp9nD6VLSsA15mGhcpy66+CDPF4c
 dCgMXq8hh919qU2fZjtm7MSCmrELd8282gy3DVnT12XQYh+75y2BJIiDBMSXVnn/C1mGOyv3Y
 arffGYJ997yJriMFVRlEm+dM/aMlNXK4LmQIaA/Wf2YAfGKvLFEb3Lld4VJj1qqojeP2cFdUD
 SKInK4mZ5rJUPlcaq47SFnqpCh85hgp0ui/i76EXiJOqmMncM6yYIBwlgTX+KgZrG2J/Fhxmw
 o4OzHNKJwkZDuZwDqaXuc7EhfE5nl9TqqxPQBa/z7dzwT8ZPuviXz4i8YQ5mvqs3MFsC/2CIl
 Ht851YCUu/DRNaY4BrgwKsq/smZ3RbJKPjvRQeGIuid3H0HHO8MhzaszqCrEJ43tRab0+THzZ
 uGjJO+iAGeB+LkzbY/SxHTBAJDWdL/v71klMtGoVKs941/Y6C1OJUjCunr9hG2s7ok5VQqSv8
 z4XPLB3s1eUehcoVuXwOhmR8AHNSZeJlExmG/KRFe5+eD69h8Xx99l9wLoWuJvv9S5qjMyBqe
 kZyNYPoAwIj1T6g6WWvxP+fgLM7whTLzc/zZ5LF9JyzVwONazGLpYqqFVagZlhO5CSTreLbco
 9fWyIvzQSed0Y2eEpvytXIp/yK3DZnBRVT5dk9u97SG1q+ddKkm82C78JU8ZeIU/1smFhfW92
 +qw4UuXEWcQ2TjGTJQaKgpmKSwvUAdd9+B0q35zonAeuFVUTpC32tHXYry1DSgA5DzXpQ25tF
 6VKUrdxipWDIlk/TclswHJU45oO/1ch1xG6zGwEBJDf98=
Message-ID-Hash: CFPB2DMMBKY4TZ7P6JNKB5H2UPS7DQYI
X-Message-ID-Hash: CFPB2DMMBKY4TZ7P6JNKB5H2UPS7DQYI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFPB2DMMBKY4TZ7P6JNKB5H2UPS7DQYI/>
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

