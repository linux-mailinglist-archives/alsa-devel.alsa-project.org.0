Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPSdNO1MqGnUswAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:17:01 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7B82026A0
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 16:17:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4108760252;
	Wed,  4 Mar 2026 16:16:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4108760252
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772637420;
	bh=2WvJBpg6Q3InXI8OgdU+4PjKJ9J9vxRzAiFZhlksuJc=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o5nZL/N6G1zVBsnhPTVju771fmWpZ0MBqGOngNEQI9jC95lH/E5DIvfD7zrVhOGG3
	 fCDxv7mmnUSxpyuAgFSDRnIVQI3+9Sbihu104Z7xA3hjJvO77dsm0JyAf9zJGnllOI
	 Q2SQixz5h09WP8Js68lKbPri+0Pp9bYR+gdA/Hx8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 507D6F8060A; Wed,  4 Mar 2026 16:16:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 085A5F8060B;
	Wed,  4 Mar 2026 16:16:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8D49F804F2; Wed, 18 Feb 2026 01:54:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,T_SPF_PERMERROR shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com
 [209.85.128.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96677F8016E
	for <alsa-devel@alsa-project.org>; Wed, 18 Feb 2026 01:53:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96677F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ooz3EBNa
Received: by mail-yw1-f196.google.com with SMTP id
 00721157ae682-796d68083cdso5328577b3.1
        for <alsa-devel@alsa-project.org>;
 Tue, 17 Feb 2026 16:53:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771376035; cv=none;
        d=google.com; s=arc-20240605;
        b=Yotu+IxdyaoI1gmUMW7GT2pLIYQCENSLkaTCXY0gd01Ao0f+y7raufVSu1HkzIgVgd
         LAct/tXGUpHvcoVZQN5RK5K1o5n5shGea1hZ6DgnsP5B7Yj9w4zEmoFLMeLUqbvry+tm
         35P+qqdlbZ3X0yMnxlzPsZffDQ/Hn10zyIL761aciGDnUsNAQCwxBBDuDWwVNePfInzc
         tSOsopiAFYBUPpncSuRAmegjLbJwV9tEEpY+MBG6bsnMwbIiu4rgZV++aAJxrHJJRvCE
         ZSmnxoxQjpoxgxNyv/1/SK5i3wUB+ZWUCKSlAoDkYP070wILCe/MksG1uGaXvOfidH/6
         rnPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gp1T8XLy5E6ggfMjzyNr4ppwN4b8iHScukYgSx3PAak=;
        fh=dBSINSrh+dZtWEP0pR2323P8G/MRu1im4fhQaZzZhOY=;
        b=VLHnqUzw5nTNdEdUi7qPcz819Dn04f9ygxskCqDHKkKaKZfmvI4TX97SoZ0N51F+HS
         iaujo+tPAnoSL2naL3FaKJsfY7Ze2g8anvD4wrheSLyMoRIr+46jNHuNKrq7hOns86UT
         yb7+bKDm6Qt+rEvtUsvNeJZBMwT5o2CoMU6pPv+HvGThuR+jr3WUNT2miK6oerFu9qUP
         jaTwD05r+/PzKUaGxTKpFx66LJ4bgc57/c8z/imkjCGQlTLmuwT1d7jEjL2jIkk9h17P
         SjO9rGV3zWh0lNqed3u71nJI58+Uu9WeEZYhWbGMZswLjLqVunqnJKK/BIPcZyJrNbak
         dP1Q==;
        darn=alsa-project.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771376035; x=1771980835;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gp1T8XLy5E6ggfMjzyNr4ppwN4b8iHScukYgSx3PAak=;
        b=Ooz3EBNaK3MwSRiMJjhQdB9BX1OqNB/M7lqcHuyJeVYzDt2qG1O4qaK3xLljNaC8gj
         koCbr52U/AogYkphI9WRCJ72ZNDLLgm/RlMownHWpNhLM3nb/VQUWetM8278I9/4S/co
         0wRG3El7e6VEnzWkT97h2R9o/4UR40eMQO9T91jZZBOS3BhSEqtTctgaNUpMabhFh9bL
         NTShIZVdUrPIF2T+ICd42k0Eq5FYEwGZrteHMSb+Pg+cxJKKq5UCQSPWj+s2kJUdBUqU
         A1qVweBtsrw47Ut+kSmZaxAAyQ+kFY3SpxXH0LRLtttWxoWc3PpNgq25DHuoQ1smZ0I+
         KFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771376035; x=1771980835;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gp1T8XLy5E6ggfMjzyNr4ppwN4b8iHScukYgSx3PAak=;
        b=fWehIEbcHQIh/oGcO+QApRj/pTEdZAOd7NgJxtg2zQmwZm1JMYzns18EAw0WOzAVAP
         eltkyZWPvCMTfhZjOuI5nh2n8CDt9F8uZnP0AH5FtH6FhigY+GaY7AvMU2xe/tFKor9L
         Csg7cwpBcWJdsPFp1v6KvWQpWe8uPVsfKMCQ63NSMe17MwAzHHQ4bfJWxMXctVBRygbx
         86EJ7bM+FA+ofONiw2W1yvY7v3XCGyM0HZADYx0dU/EOnICg6ZWCCLuPu1p26Xv3cgN8
         JZW5mlZxevyut8ivFTbpkXoA4PJa7cDKR+1BP3VU1RFMo58k9SCOZnD9/UoWQh0oG9bI
         8K+w==
X-Gm-Message-State: AOJu0YwftprZRVPmCnqDdRSR+7MtNhAcRd/ovsnrLfxoYRbEvoZjilcv
	yr7yUM2ebdYG5KJ7ZKl09W8oRAtbMOZqt/Ky93kMhaxdJ/1yr4OGKPc+K0s7Mk0VixTF+vJsH5y
	wfUU2nvzG+fUvu8QdF03Yzvw8Skz9AU7oUgb/jKk=
X-Gm-Gg: AZuq6aIZdbdRE4erQNnJO71TTrdHmi5tQqcaQb78Dtcnj4IV5MvMc1FkX41bcLlrj+z
	M/GOl3OfaqQ2qyf7kZNei976C4n5Ir0sBy2qSntB2cH6Qm3dt00poWbTtCqPUEfJQr3RyZ8KcV5
	A0KQCnb9fdEHB8FV9YQGtFwb1mD+xSwdVn/JCS9LeTLOufwjqd3564JY6I0pBBZBSsiwnSbhrte
	w8aLLreXSXCrUS/PYQ0Zh1JAR3iGuFvEITZQuDzAvK6ERUndTsqiozd6Dtk5jq/8nwK2iTcWivr
	QkaWhByvHELK5D3A31zGb9fJrtkjSl0NW/HjIQC01Bqqi9Ghnw==
X-Received: by 2002:a05:690c:660a:b0:797:bc42:9e35 with SMTP id
 00721157ae682-797f713b51amr1963857b3.23.1771376035288; Tue, 17 Feb 2026
 16:53:55 -0800 (PST)
MIME-Version: 1.0
From: Fang Junhua <junhuafang9527@gmail.com>
Date: Wed, 18 Feb 2026 01:53:43 +0100
X-Gm-Features: AaiRm52UKN8WjerGp2hcWdemR0tuMG4OZiHMh_4BJ7KnhDbE-w73on_5W4VR6fU
Message-ID: 
 <CABzdAZw8g6twGp-CK4_SA4f51GmWQLhd+qJmFmwWUmeJ-1FOfA@mail.gmail.com>
Subject: [ALSA][ALC287][TAS2781] Lenovo 21EK speakers silent on Linux,
 headphones work
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de
Content-Type: multipart/mixed; boundary="000000000000594855064b0e9f58"
X-MailFrom: junhuafang9527@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FQCDJOAILUFKYA7MCLWZBMCIEULYDTWP
X-Message-ID-Hash: FQCDJOAILUFKYA7MCLWZBMCIEULYDTWP
X-Mailman-Approved-At: Wed, 04 Mar 2026 15:16:06 +0000
X-Content-Filtered-By: Mailman/MimeDel 3.3.10
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQCDJOAILUFKYA7MCLWZBMCIEULYDTWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 3C7B82026A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.39 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DATE_IN_PAST(1.00)[350];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ATTACHMENT(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[junhuafang9527@gmail.com,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,mail.gmail.com:mid,alsa0.perex.cz:rdns,alsa0.perex.cz:helo]
X-Rspamd-Action: no action

--000000000000594855064b0e9f58
Content-Type: text/plain; charset="UTF-8"

Machine: Lenovo 21EK (ThinkBook 16p Gen 5)
BIOS: KCCN44WW (2024-12-09)
Audio codec: Realtek ALC287 (hdaudioC2D0)
Amp/scodec: TAS2781 on I2C (INT8866)
OS: Arch Linux
Kernels tested: 6.18.9-arch1-2, 6.12.73-1-lts

Problem:
- Internal speakers are silent.
- Headphones work normally.
- Audio routing/volume in PipeWire and ALSA is correct.
- Streams are active to internal analog sink, but no speaker output.

What was tested:
- PipeWire/WirePlumber restart, sink/port switching, unmute/volume checks
- ALSA mixer switches/volumes verified (Master/Speaker/PCM)
- Multiple model quirks tested (including alc287-ideapad-bass-spk-amp
and yoga9 variants)
- Rebooted after each test
- Windows on same machine has working internal speakers (hardware likely OK)

Likely issue:
- Missing/incorrect quirk/fixup match for this exact SSID/subsystem in
snd-hda-codec-realtek path with TAS2781.

Key logs:
- Kernel often shows autoconfig line_outs=1 (0x17) with speaker_outs=0
and hp_outs=1
- Device INT8866 is bound to tas2781-hda

Attachment:
- audio-bug-21EK.tar.gz (full diagnostics bundle)

--000000000000594855064b0e9f58
Content-Type: application/gzip; name="audio-bug-21EK.tar.gz"
Content-Disposition: attachment; filename="audio-bug-21EK.tar.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_mlrbicuj0>
X-Attachment-Id: f_mlrbicuj0

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
I4000kgjjTTSSCONNNKz0v8BmgoLnQDwAAA=
--000000000000594855064b0e9f58--
