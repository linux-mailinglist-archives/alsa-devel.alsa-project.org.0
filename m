Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C49283A1A5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 06:58:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 054B0852;
	Wed, 24 Jan 2024 06:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 054B0852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706075904;
	bh=fJ/ChSAOHQOyd2iOF8Uwehz9ZwYKjCnQ0KO5SVBhUTY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FDBYxwlmhykx7BM81FJbSxO21+mcB9YvXIOD9MaQVssDuQvmgi5Q2ZZOQHASi/UMG
	 5WBDvmgUYPpvBRqi6ITkXgeVSTPfbQvt3HPTT8AZLHl3lmpB4fZw6P3lJmCg/Yj3ko
	 9l8CDcBLazQ6m8rgYPWiUsfB7jBrTLf98EQc9Xt8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B42D3F80587; Wed, 24 Jan 2024 06:57:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21E90F8057D;
	Wed, 24 Jan 2024 06:57:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEC38F8028D; Wed, 24 Jan 2024 06:51:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D5C7F80149
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 06:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D5C7F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BcqmeDZC
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6daa89a6452so3484787b3a.2
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 21:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706075335; x=1706680135;
 darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJ/ChSAOHQOyd2iOF8Uwehz9ZwYKjCnQ0KO5SVBhUTY=;
        b=BcqmeDZCqqqXv3NJDobbcknDkYDjlILDXXKbKjyUltFerCbfz5iYnEhIgiVnWNlOjZ
         eCeYgzbxR1uUShVLtCWrfbc8v6AG1YkD+KgQJwLh6gOlWyGduUiSgUgzNONB0pUsdrwm
         dpuuYXBh4trrjinaG6IR69AQRoOhQWWu6vXUNyBk0vilbhCqc1dtZD6gNOk6kjtaLRif
         ofokBeJQ/oGcTy2Gl756ptGVMQl8lRh/KliEYO2vMkVNX0jGR+Z4p2kYyLy68EK39xUo
         k3hrUg4eCLK15mU6Hb4+MjebKRcytiP2CanF+l/yyQx6+YoujObJky9ddwvvQnQklbPs
         KpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706075335; x=1706680135;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJ/ChSAOHQOyd2iOF8Uwehz9ZwYKjCnQ0KO5SVBhUTY=;
        b=Ph1vxSD3F5vl7rEzFCCp40vQSA7tmjgkNOG4pcNQ4HjFcYmG8UIn0sdW7A64tFjBIB
         MuGQ8N3i/7gBqIbW9VG1+gDc/ovfl5AH5JPSrCNImDX3uf437Lpk9xH7cTpPPMl5Pdux
         ngZtM/VNIU6AAqnGmD5GV+Duy7szNfn0ylaSqP8hruxHxElxZpTS6hH7A2CfeCIx+ZBw
         /QEasNCCdsEyubHarzpgMfvx7toB+pzTQJCG4qdssBjG/7HaChXwL189oWB5MmMANxO+
         MZ96LI/hivXsCQdIKUds3JGf1GIZv0TNc2lri7plffKg+siPnWnTbFHnH9tyBdRpW8h3
         JAVg==
X-Gm-Message-State: AOJu0YwX7tnHgm9Xcr9e4d15NMRIcxVtk7UTWT8dLfoDhb256MIjevSs
	qx2aSl6/aVM/VaBuQVJMLZzj4CmOjfrfr1W482ljLeKZO5Xh2Jd8UI4jxX+c+Sq8hg==
X-Google-Smtp-Source: 
 AGHT+IH2UWPOZSNgIvdFb5se1+rGMntPcLN6Ttupp13kR1uNAihCVHMiboilGzNUlB03S9xkBuFXRQ==
X-Received: by 2002:a05:6a00:460c:b0:6db:d4a2:f613 with SMTP id
 ko12-20020a056a00460c00b006dbd4a2f613mr4242961pfb.13.1706075334687;
        Tue, 23 Jan 2024 21:48:54 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 o7-20020a056a001b4700b006dd89359c66sm667921pfv.157.2024.01.23.21.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 21:48:54 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: RE: [PATCH 3/5] ASoC: codecs: ES8326: Adding new volume kcontrols
Date: Wed, 24 Jan 2024 13:48:45 +0800
Message-Id: <20240124054845.30207-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
Message-ID-Hash: 55AR2JZR3M3S6BXIZCWLV6E2VVVITDY2
X-Message-ID-Hash: 55AR2JZR3M3S6BXIZCWLV6E2VVVITDY2
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55AR2JZR3M3S6BXIZCWLV6E2VVVITDY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> ES8326 features a headphone volume control register and four DAC
> volume control registers.
> We add new volume Kcontrols for these registers to enhance the
> configurability of the volume settings, providing users with
> greater flexibility.
This is much better integrated than the earlier version, but there's
still a few issues.
> +static int es8326_hplvol_set(struct snd_kcontrol *kcontrol,
> + struct snd_ctl_elem_value *ucontrol)
> +{
> + struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> + struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> + unsigned int hp_vol;
> +
> + if (ucontrol->value.integer.value[0] == 3) {
> > + dev_dbg(component->dev, "HPL_VOL does not change");
> > + return 0;
> > + }
> This will silently ignore attempts to write the invalid value which
> isn't great any might confuse some userspace code, it would be better to
> do something like
> val = ucontrol->value.integer.value[0];
> if (val >= 3)
> val++;
> (with corresponding changes to the other functions) so that we just skip
> over the invalid value without userspace being aware of it. We should
> also be validating that out of range values are rejected or at least
> constained to the relevant bitfield, other than 3 any invalid value will
> just be written straight into the register (rejecting should be more
> robust).
> > + regmap_read(es8326->regmap, ES8326_HP_VOL, &hp_vol);
> > + hp_vol &= 0x8F;
> > + hp_vol |= ucontrol->value.integer.value[0] << 4;
> > + regmap_write(es8326->regmap, ES8326_HP_VOL, hp_vol);
> regmap_update_bits().
> > +
> > + return 0;
> > +}
> Also please run mixer-test on your driver - for this control it'll tell
> you that this function isn't returning 1 when the value changes, meaning
> that events won't be generated when the value changes.
> > + SOC_SINGLE_TLV("HPL Playback Volume", ES8326_DACL_VOL, 0, 0xbf, 0, dac_vol_tlv),
> > + SOC_SINGLE_TLV("HPR Playback Volume", ES8326_DACR_VOL, 0, 0xbf, 0, dac_vol_tlv),
> > + SOC_SINGLE_TLV("SPKL Playback Volume", ES8326_SPKL_VOL, 0, 0xbf, 0, dac_vol_tlv),
> > + SOC_SINGLE_TLV("SPKR Playback Volume", ES8326_SPKR_VOL, 0, 0xbf, 0, dac_vol_tlv),
> It would be *better* if these were stereo controls, but it's not
> essential.
> > +
> > + SOC_ENUM("HPVol SPKVol switch", hpvol_spkvol_switch),
> Switch should have a capital letter (mixer-test should catch this as
> well).

I'll take your advice and submit a separate new patch
