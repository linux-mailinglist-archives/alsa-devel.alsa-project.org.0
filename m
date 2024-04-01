Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8BB893AE8
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 14:24:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC3B02391;
	Mon,  1 Apr 2024 14:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC3B02391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711974251;
	bh=phG6hMmRktyZLOVg+7TkRrTGOtgfboaALXpa6eHwtgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JC7frFyBbJeibHAR/AgcXRZmRNaLcmZ5TWejJYCrEHtj1oP+i5FzKWmr0IUsZIZWJ
	 wY3LxkpiGFY40zY5UnF1xgkx7jC4lpJdv5ca+4VkEHIjjXAhQkRU670ElLcC01y5FR
	 nD/6BpRSgUzeZuDlXLV7Q0JDzcl1C1MTuCLbPOWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C985EF806B9; Mon,  1 Apr 2024 14:22:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC2BFF80589;
	Mon,  1 Apr 2024 14:22:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C382F80600; Mon,  1 Apr 2024 14:21:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BBE4F8020D
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 14:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BBE4F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=KLaQQqpM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711974089; x=1712578889;
	i=oswald.buddenhagen@gmx.de;
	bh=N+qXgc++moh3UpHq5GwB2BTSLu0+WsnSqCyKOAQ55qo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=KLaQQqpMsUovezNFfGeSmBZD5Ryv08zAsj8A43GQf7a51NNon/7JDaLuOFlHjUGF
	 ojDu0+693t3xkyPzEWGF30GVq32GR4AANlfSzKlpBSa2qLih9frP8UBRVaIO9XueP
	 aNhwIhJOA0eA27SB1bz5W0LUQpsoggn/1HPM07sn5OE9zCfqHqX085JPHDJ3rhsma
	 DpqP1W6bAkFJ2sk3CwfoXATC1S/QQgtmVgVh8L8XC8Kw42j02fBrupJBHQjUN5it5
	 NxZ/rZ2GZYYtT1xpRO4CmEV8TrqgDCeB73ATD+z4Ph9dCj8KpSIoqiFnA+Ywfg6Ds
	 DWeqG2PNE162O0yMIA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuDc7-1shAvc2ax3-00uW3c; Mon, 01
 Apr 2024 14:21:29 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7es-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 14/18] ALSA: emu10k1: fix wavetable offset recalculation
Date: Mon,  1 Apr 2024 12:07:38 +0200
Message-ID: <20240401100742.506001-15-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vLAQrOFl91Ipf440/++p9ydbBTkY78S6rLq1k8tFo5Ek9gm//fz
 XueAgalC2Pyo6mxUjTvlSTZNn6Cv0oyPB1JV/NXQg1BrvToQxBDI1wQmWWTy+PgV4ANDoMZ
 q4H1+SgBPbJxzIvdS86JY5eVGQYi9eGS4PvulZ0VINj9RLR/CE0IgIs40v9lcoB3o1PKzwX
 6/PcmxBhCcGTkSx7VBpow==
UI-OutboundReport: notjunk:1;M01:P0:1ti4O3dzWdM=;UkX4ogIwi6PZ7meNhGNVeosZ5YN
 FHB1/NV1n5i4+B5DmKl8FVacqL9OdbXMlf7tLv46fcWGh5NxTQN4o0SIvtg+LafL+T0Hn/Dl1
 3Pz5o/+6JwW2NH2ZyMBNeZvmDj+OhZsrzyAWHLeTivX7oC2DDzUX4PTcLfQCBUDnseD6sdYcp
 eiZ6AnIflRWzlCa9jFWKR9xOyi5wdK9FSV/b4BG3T2KSlaW0iSnhdQ7Uzka0uyMB4p2OQ3STt
 f3bLnLndOcKKa2l41JR6ixWPMBJdjI2sbIDSzGtyNQmKT88DNsyt8vHQMG/Phm49GymWgflmb
 n0WwwDKL4wp5VNL+QzcD1ooB1FpXch3aOs2AhtSw+8D5y/DZn3Evs0KACnhz/NlfzuoZzbXw/
 FJXm7DtsEWk2H/8mHiFfQvaich9iLsbZPJFN0nRKYNCu7cgxxkwgVYKNDhGQ4V5fzs//s9POd
 CQu6PYmR2xpmxGyPf02oBPy9R1yhgKYyxpthwQIsONlJbo1fs+KJ05e/rsxY3RojDl2Mz6MeZ
 ZB1eLwzXrGta8kj5gxfwIigDJgk9+0MvJ/FNA0gGm4LPsjgjTfa0l2o7l4x+4ke80N08nqTYf
 B3YjHbjdg/WXECTng0WI3wDg8RtE/bpeb7hTBJNuPaoepCw1wU/qtq4lD5ad/ooX028rm8lQh
 wokaxhGnyQdPO5uoFoAtA3Bzdy7CDJWfJHtde19UIkPd1k8TH4S8+8sx9UPEXU3ZSHEdC8ON+
 9EEZDlrhn/N4nxNwdkZbVUwQdwqV9FI/RORUnEmDuUiCaShdwCSW46X4jkvhKfVK7xekfZdeM
 5p/f2KVkQZzevtOhGB2GqlPbcTYiBiAyOrD0T9V5KuF7o=
Message-ID-Hash: PKDD2T5OB75NBJOCNDHJE7FCZLZ6Z4NL
X-Message-ID-Hash: PKDD2T5OB75NBJOCNDHJE7FCZLZ6Z4NL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKDD2T5OB75NBJOCNDHJE7FCZLZ6Z4NL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The offsets are counted in samples, not in bytes.

While the code block is being rewritten, also move it up a bit, to avoid
churn in a subsequent patch.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index c7d54f38d28c..eb8365650bd4 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -30,7 +30,6 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 	u32 xor;
 	int offset;
 	int truesize, size, blocksize;
-	unsigned int start_addr;
 	struct snd_emu10k1 *emu;

 	emu =3D rec->hw;
@@ -62,6 +61,12 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 		}
 	}

+	/* recalculate offset */
+	sp->v.start +=3D BLANK_HEAD_SIZE;
+	sp->v.end +=3D BLANK_HEAD_SIZE;
+	sp->v.loopstart +=3D BLANK_HEAD_SIZE;
+	sp->v.loopend +=3D BLANK_HEAD_SIZE;
+
 	/* try to allocate a memory block */
 	blocksize =3D truesize;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
@@ -99,15 +104,6 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 	if (offset < blocksize)
 		snd_emu10k1_synth_memset(emu, sp->block, offset, blocksize - offset, fi=
ll);

-	/* recalculate offset */
-	start_addr =3D BLANK_HEAD_SIZE * 2;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		start_addr >>=3D 1;
-	sp->v.start +=3D start_addr;
-	sp->v.end +=3D start_addr;
-	sp->v.loopstart +=3D start_addr;
-	sp->v.loopend +=3D start_addr;
-
 	return 0;
 }

=2D-
2.42.0.419.g70bf8a5751

