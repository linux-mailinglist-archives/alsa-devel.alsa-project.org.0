Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEzKGKgiqGl3ogAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 13:16:40 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C1F1FF8F3
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 13:16:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6357A6023C;
	Wed,  4 Mar 2026 13:16:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6357A6023C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772626594;
	bh=LjyPwwKgXmbisj4AnsdfEMhtr7wxh2oD1xIYKVnRbdc=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nPpIs2rp7qDPHCnTt7QwlyKj98l1C9jrMSXpFwpgoWUd/u1N5tzJq3DeeVYu8NQh9
	 93g2Mm2qT9CRHWUL1cP6eqhsZN+A/BhIkjYKgUvYAA8RkkwXoxvKYzMR/CPMwTGhtL
	 uKbUJyQVVdpb/mM+US7WXSXvKQMR0dzeb53gjLtI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14B0FF805EB; Wed,  4 Mar 2026 13:15:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFF9CF805EB;
	Wed,  4 Mar 2026 13:15:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DA22F80533; Mon, 29 Dec 2025 01:53:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.8 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,
	T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3834BF8007E
	for <alsa-devel@alsa-project.org>; Mon, 29 Dec 2025 01:53:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3834BF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hRBcGNBT
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-34c902f6845so12196662a91.2
        for <alsa-devel@alsa-project.org>;
 Sun, 28 Dec 2025 16:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766969610; x=1767574410;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p65w2vwx/1LMoaqq1M+K+j3xGKGdOVAjkkV5xkSX9DA=;
        b=hRBcGNBTlWNjFyhWVz4hdNux7WlpoZ85ZBbaHCc+P12J6WSbYUMW0t1MMVd1rH8sVU
         zTambI+PgmU2Lz0Q6+XnZmEkHGmSbyVcEc/+8gemf6wnrzV4SoaNKI5K3Ohkh2wziuh7
         GxB2tBZzgLltpZDCw4ktxrVwHbC3J6fpDrC1Ynjw0QwgAP+Yj44SYqkH6uQYtER0LZmw
         tuk6rO7SeH9RBViAnITminb87jrz1CjNKnnp/1E7MYV6hCAEEyWcx+xOAuPD3+Meejdy
         2chzWLSiDeiTz6OHKKAAfG93g+HpDlMLV4UBBiPBl0+PqhfJX6OvQJfa+vjAfW3F+bZe
         Cbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766969610; x=1767574410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p65w2vwx/1LMoaqq1M+K+j3xGKGdOVAjkkV5xkSX9DA=;
        b=g0Sp/XKM4nZ7SVDPj26q8v2n1wrK9lzbVBVWkOS8lNthlRTgHzoKyBCxxCKrWgS0l0
         DWOX0EmmzbUKLJEUClGjpiBGVNWHRvdBidfyQQK6+7Xc/fepzlbgmp4eJhrDVgSEdFDI
         ih9cx2PfPOEGnh7DG4mZMJTZJDzkL9GzZS6rtVKbrU0y8s6PO0P0Z9J8PWsgWf20qREw
         8zN5Bn0QY5Ujj33ddOvV/wJycvTe15zvCW2Q5AX4JPnUAxbXwKUWv8mOBS3xmtYrpSxl
         +wxy6jaJWpoGdqjsrBZnmSxl//3Rs8w8Y6OdCTcUT7GYYW2xEgrEEDahPwMSrlkKGOXK
         9Q/A==
X-Gm-Message-State: AOJu0YxiVsifJP3MlR6eyLMrHaaYWYJQBo3LcsDrvAy+qDfZTJaXT+sa
	QYSTRQAz2BcGP5D2iCwbkSRJ9lgEx10TM5EZYY/dS4kSTwdpYGPSYb0AoLl6nn4izgG5E9rIeY4
	/Fu3aBWXUv5P8NFZoag5QFIvvJJfRjRgwC2/T
X-Gm-Gg: AY/fxX5GpvmbyAFaJOgw5vkwf5ZHWDGRdqEkpkx/8DfKYQfII5Rsv5dzublJrF7e6Pk
	shBII58KkmFPwircZYSJxpo9Pwi/zErW3KRqrQjkHDgV/61Pvbv8uSr67mPB7yXtXxy9jNq6Y2G
	eM7P44I1GsH+RYh7GVRnWXTqshycmtig18uYWnmBHsvKlmKFoidnFuY2evRXklbP6qECoq9/MEd
	hB656ITGlAnRaiH8D5C1/O4Luskmsp+KAA5W5ESGaTMy7T3Kf1o7GNTyx0RcnvlZ5aTGuGWICMP
	kZskVg==
X-Google-Smtp-Source: 
 AGHT+IEUFGPq+pxlck/wmZEin1TSi6bYjbd3SDQqGvDQWgs6lIGVPHvhFO2xApOhx8F881iw25aRD1ubonxga4OTcCc=
X-Received: by 2002:a17:90b:2e08:b0:34a:b1ea:664e with SMTP id
 98e67ed59e1d1-34e9213ae30mr25228481a91.15.1766969609542; Sun, 28 Dec 2025
 16:53:29 -0800 (PST)
MIME-Version: 1.0
From: Andres Ballesteros Gallegos <andres.ballesterosgallegos@gmail.com>
Date: Sun, 28 Dec 2025 16:53:18 -0800
X-Gm-Features: AQt7F2oh59NnOg-w9AxQ7xDC7Gkld9ZJ7saSvx4q7LEbsTgkDXc3bQDXtVuS6w4
Message-ID: 
 <CAOFJBMEqXqcwzUBNv0VJqw9eZ4vfbeXZBPJrKaUpyaL1-VVsXQ@mail.gmail.com>
Subject: [PATCH] ASoC: amd: acp: Add support for Huawei Matebook D14
 (NBM-WXX9)
To: alsa-devel@alsa-project.org
Cc: broonie@kernel.org, marian.postevca@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: andres.ballesterosgallegos@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YOMHNBW6SOQVE35ABGXNPL2ERCEOT2ZJ
X-Message-ID-Hash: YOMHNBW6SOQVE35ABGXNPL2ERCEOT2ZJ
X-Mailman-Approved-At: Wed, 04 Mar 2026 12:15:51 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YOMHNBW6SOQVE35ABGXNPL2ERCEOT2ZJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 03C1F1FF8F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	DATE_IN_PAST(1.00)[1571];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[alsa-project.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[andresballesterosgallegos@gmail.com,alsa-devel-bounces@alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	TAGGED_RCPT(0.00)[alsa-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,alsa-project.org:dkim,alsa0.perex.cz:rdns,alsa0.perex.cz:helo]
X-Rspamd-Action: no action

This patch adds the DMI quirk entries for the Huawei Matebook D14
(2020 AMD Renoir model), identified as NBM-WXX9.

The device uses the ES8336 codec but requires the FLAG_AMD_LEGACY
configuration to be selected in acp-config.c. Additionally, the
acp3x-es83xx driver requires the ES83XX_48_MHZ_MCLK quirk to fix audio
distortion (static/clock mismatch) and ES83XX_ENABLE_DMIC for the
internal microphone.

Tested on Fedora 43 (Kernel 6.17), confirming working internal
speakers, headphones, and microphone.


sound/soc/amd/acp-config.c | 11 +++++++++++
sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 7 +++++++ 2 files
changed, 18 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 8e45f2a..1234567 100644 --- a/sound/soc/amd/acp-config.c +++
b/sound/soc/amd/acp-config.c @@ -148,6 +148,17 @@ static const struct
config_entry config_table[] =3D { {} }, },

{
  .flags =3D FLAG_AMD_LEGACY,
  .device =3D ACP_PCI_DEV_ID,
  .dmi_table =3D (const struct dmi_system_id []) {
  {
  .matches =3D {
  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NBM-WXX9"),
  },
  },
  {}
  },
}, };

static int snd_amd_acp_acpi_find_config(struct pci_dev *pci) diff
--git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c index 9a8b7c6..7654321
100644 --- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c +++
b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c @@ -432,6 +432,13 @@
static const struct dmi_system_id acp3x_es83xx_dmi_table[] =3D { },
.driver_data =3D (void *)(ES83XX_ENABLE_DMIC), },

{
  .matches =3D {
  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "HUAWEI"),
  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "NBM-WXX9"),
  },
  .driver_data =3D (void *)(ES83XX_ENABLE_DMIC | ES83XX_48_MHZ_MCLK),
}, {} };

Signed-off-by: ANDR=C3=89S BALLESTEROS GALLEGOS ANDRES.BALLESTEROSGALLEGOS@=
GMAIL.COM
