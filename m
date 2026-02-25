Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNgmD4khqGkrogAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 13:11:53 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2B31FF87C
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 13:11:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE66560236;
	Wed,  4 Mar 2026 13:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE66560236
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772626311;
	bh=wilWMV5Qhh8ZHNsN7Z2dQD3lC67WZvqbUZ4NahHmljQ=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=l0L9muzilxg2rrCl7qxelmHseNxx04+qIBQ/UI5OTcm8Uv1dukR52wi9UwsUDhkjy
	 IFzyAFH9CQUjCf+5U1eZKIjlNyUl5g259otm/lZ1i6xja0zLfEc/ZbC/gft8YxEcI9
	 vRO0nlCDpAqhdZA63lsdIPuo3iyAX/MUIyLOYjuE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AABEF80621; Wed,  4 Mar 2026 13:11:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4AC8F80612;
	Wed,  4 Mar 2026 13:11:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EABBF80537; Wed, 25 Feb 2026 18:37:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.8 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B10ABF800AE
	for <alsa-devel@alsa-project.org>; Wed, 25 Feb 2026 18:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B10ABF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SMzudueW
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-679d05729feso12822eaf.1
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Feb 2026 09:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772041017; cv=none;
        d=google.com; s=arc-20240605;
        b=CcM7fUjrNFIXU5HIBKllzj7ZKSj0oBLP/MuZjYG66eoT4srxHU5aFMb1Dz8FB6Cacb
         UvRQwxZ8PrMoQEwE+uCwSgChtc5eBEWb9WoMRIEdxwsvlqt042qkRAEG1J/gjYfRNTjo
         6dCi/eP3AWrM7H0QiY3IKS+IdAdjNaY9dBh5Li75sEmM9lOsONr+RHHantZTVeizJNnR
         M3xSnZBfhHNaw6JU9laov8XHiJaKD5yBC0PE9oU5to/Nq2bSvfBZ1gzlN7XuSfjb/bhJ
         ZgCNWT4lQRRg3yMaITQ14SNdo3D8nPS6Vkcr5iy2vcXJ0rX/dpVs6go8Q0nkBurJ5gAJ
         /YrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=F6Fd0wt0XgaLNGTaC3ImSmTS5dVsJs1QAAeGa73lk0Y=;
        fh=NdWMDR0Jvbb4Ldpa+5zCwBiJt/oyQvqp3C8cdqlfoZE=;
        b=KL9RnGQTAGa1jBNaMk8iLMmc+1RJrqMXywH1EG0JYIK3A8DIe8tFZlyR5E7Bm421dL
         hVRYz9m0v5OA3SW5XoUQnj/xUcBMsIA6+b8CooTrp5QZuwQ1Qi59aEspKJ5Gzx+OCYVT
         tXwoLwKyTiC+5eXH+ibR0dkFrgbPR5V6hWtM6+hZKSNKb4Yd4hmtntASc0386PldBS8R
         qKoE0NJMOXguCh1jiwFEWIvQm1X3JHpEJek/KDE/UM3gHH0dW5yaiUvGu6yHOR/mt0XS
         wbyq/8WJsNYGAMXz8UlvguyZ6nFTMvsk4rk+tlvwL+pSJzIRGsVZnfD2IQT3vdCyiDvD
         OdRg==;
        darn=alsa-project.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772041017; x=1772645817;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F6Fd0wt0XgaLNGTaC3ImSmTS5dVsJs1QAAeGa73lk0Y=;
        b=SMzudueWUklD2g6SS+yJIqaPMEXvBUjSOwXl5JmrxLKetosujHO5T+eKaW2ZOscTi3
         I6sYPkJWim2bZqUc12bXD0xKt19Jr5RjJzUQzH/pRLPB2q6uM1lJAJANt/Xglvq/MMS3
         rD8hm/aMWLlITHzU3FlLGXakCSYxny5kgcALt+xn+9r+tLFqmiJutVEIHCpAgFf/+6/W
         RaIVeQHVSnUPU9O9F3gYecUTSGxT1fb0b/oNBbpQbEZWH5J78g/fbl6G1IteqW952Q6d
         UM5CZby/IY29E8e9TY7rFPhLVf1wQApsN25R/rNRxqbKiFbCjaLQv/6eD2ilQa3Alc2Y
         F6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772041017; x=1772645817;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6Fd0wt0XgaLNGTaC3ImSmTS5dVsJs1QAAeGa73lk0Y=;
        b=i7NZpVBc5NvaO15bZs1ZPzYiswRaOcQ9hIBbaz7vctx4+pbC6VHu5fwmwtca5Gi9BL
         /MFQ6aJxuSxhUmkpgT0+Es+yxx/iIb+fhmHPfyloA/u4oBSMQ3nEm3FSgDFD/DSLMuW+
         cgSvbQjR54JACKm5dycwnThSDQNvPkzImg/+OnQShVFvOPQZzZ6OmuemHHoXsRkUvXia
         YsY1eaC9V7RmEu9vKYQnNFPRIK3FnwerSIRPqGDbUx6T3Tm3xMQYur+3W56TQt2vX/xA
         BWSh2G1sp88/JJ6ChWsMGGQXRHhA5yKYHMimM5frXMQ3foShQolVUhOLDo4PYkJxMK5n
         YMWg==
X-Gm-Message-State: AOJu0YwoItlXvKTRG9r1WYV7/oYFgQX/FsN4QBPVzFa0K8/bNmQB5AEG
	Y/m2SizcufgQkoi2rl3L5qbjQjqYlcfxYlsWUrglcu5FDESjfgLFGUz+oIDDd3gflvyCdQ9Niho
	FvXoxJTzTG5Z+Pzlrgtrq+tlNKvY98aE=
X-Gm-Gg: ATEYQzzxxgxtWMgL4u4cueA1gcVrBoyX/CmU8ez+P9kdtP3pq3ODS4MURb/tzfIJ/lj
	HrigcXOq4beiCx98PBujvamgNvmHR7CsJ+SQNvB027+bDdpP4TgKgKsq5OHNFgK50M4NbwdSPCa
	jXtzhY13vlv/FT9NUPVDgjTPB3bGwxtEPozg4/umD6fLOXZTo5WLOyrwMP+7ekxNMLBVXX8FMpi
	GNsordrHpWeyKy4ofwJnQQOZoiCToVIbaEmjSZlB2cqJ+LE02/o3wFk3nwha5y8Z4lccidewIkk
	228Uve4=
X-Received: by 2002:a05:6820:206:b0:663:610:cb67 with SMTP id
 006d021491bc7-679ef91c69amr567699eaf.28.1772041017472; Wed, 25 Feb 2026
 09:36:57 -0800 (PST)
MIME-Version: 1.0
From: Matt DeVillier <matt.devillier@gmail.com>
Date: Wed, 25 Feb 2026 11:36:45 -0600
X-Gm-Features: AaiRm51aGGh7JWP68kBeGDBRr3T0e40y3_rJHVTeWaNxsQV62vmlIdbpvDi_KvA
Message-ID: 
 <CAFTm+6DLcNvZYUT+8rU3tYoOwdbJQHufza_ChsoXmV8ep6fpjg@mail.gmail.com>
Subject: [PATCH] ALSA: hda/ca0132: Set HP/Speaker auto-detect default from
 headphone pin verb
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: matt.devillier@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LPERJCCCT7DWWFUZ3HRB6CBRFMXWLVGS
X-Message-ID-Hash: LPERJCCCT7DWWFUZ3HRB6CBRFMXWLVGS
X-Mailman-Approved-At: Wed, 04 Mar 2026 12:11:00 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPERJCCCT7DWWFUZ3HRB6CBRFMXWLVGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: DE2B31FF87C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	DATE_IN_PAST(1.00)[162];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.com,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mattdevillier@gmail.com,alsa-devel-bounces@alsa-project.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	R_DKIM_REJECT(0.00)[gmail.com:s=20230601];
	DKIM_TRACE(0.00)[alsa-project.org:+,gmail.com:-];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mattdevillier@gmail.com,alsa-devel-bounces@alsa-project.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim,mail.gmail.com:mid]
X-Rspamd-Action: no action

>From 79d54b6b2b2410ac3c169329b93607042b137693 Mon Sep 17 00:00:00 2001
From: Matt DeVillier <matt.devillier@gmail.com>
Date: Wed, 25 Feb 2026 11:25:18 -0600
Subject: [PATCH] ALSA: hda/ca0132: Set HP/Speaker auto-detect default from
 headphone pin verb

HP/Speaker auto-detect (VNID_HP_ASEL) has been off by default for every
CA0132 device since the driver was added in 2012. vnode_lswitch is
always initialized to 0 in ca0132_init_chip(), and no quirk or other
code path enables it. As a result, headphone jack detection works only
after the user manually turns on "HP/Speaker Auto Detect" in alsamixer,
which is not obvious on laptops with combo jacks (e.g. Google Link,
Alienware).

Change the default to follow the headphone pin config: if the pin verb
has presence detect enabled (no AC_DEFCFG_MISC_NO_PRESENCE) and the
codec supports it (AC_PINCAP_PRES_DETECT), enable HP_ASEL by default.
This lets firmware (coreboot, UEFI, etc.) express whether the headphone
jack supports insertion detection. Devices with combo jacks can default
to auto-detect; devices with fixed/no jack leave it off.

Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
---
 sound/hda/codecs/ca0132.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index dd054aedd501..ca6cb57347ea 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -9816,6 +9816,15 @@ static void ca0132_config(struct hda_codec *codec)
  spec->dig_in = 0x09;
  break;
  }
+
+ /* Default HP/Speaker auto-detect from headphone pin verb: enable if the
+ * pin config indicates presence detect (not AC_DEFCFG_MISC_NO_PRESENCE).
+ */
+ if (spec->unsol_tag_hp &&
+     (snd_hda_query_pin_caps(codec, spec->unsol_tag_hp) &
AC_PINCAP_PRES_DETECT) &&
+     !(get_defcfg_misc(snd_hda_codec_get_pincfg(codec, spec->unsol_tag_hp)) &
+       AC_DEFCFG_MISC_NO_PRESENCE))
+ spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID] = 1;
 }

 static int ca0132_prepare_verbs(struct hda_codec *codec)
-- 
2.51.0
