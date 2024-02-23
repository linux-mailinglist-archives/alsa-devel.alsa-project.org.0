Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 302FB8610FE
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 13:06:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E0D6E80;
	Fri, 23 Feb 2024 13:05:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E0D6E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708689968;
	bh=Uss0061bhaxFEQ47y6fzS5ksNA/14JRXVvwHisCvJ8k=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=j8Bvr+livmpmlIfPR8ajoAblo4IUlkyl/oozqx8NDO4bRamPwhrx9XtPFf9ABW64R
	 30MdqeeegqfFN0b+uxuYFT2wmS1PqWMP5aYUI4z3JG9XVtq52KzzleiBhAiB3zQORv
	 K1UYefJpoWsqjvOd9kyh2U0zOCumJzY9IaAJ6IJ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80B00F805A1; Fri, 23 Feb 2024 13:05:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0E6EF800EE;
	Fri, 23 Feb 2024 13:05:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E249F80496; Fri, 23 Feb 2024 13:05:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 66DA8F80104
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 13:05:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66DA8F80104
Received: from [192.168.2.4] (51b68dc5.dsl.pool.telekom.hu
 [::ffff:81.182.141.197])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000752A2.0000000065D889F9.001DC376;
 Fri, 23 Feb 2024 13:05:13 +0100
Message-ID: <d5b42e483566a3815d229270abd668131a0d9f3a.camel@irl.hu>
Subject: PCI SSID and Codec SSID collision?
From: Gergo Koteles <soyer@irl.hu>
To: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org
Date: Fri, 23 Feb 2024 13:05:12 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: DKBNKZUIYWUGLX7EXKO6NHYB35XELHSR
X-Message-ID-Hash: DKBNKZUIYWUGLX7EXKO6NHYB35XELHSR
X-MailFrom: soyer@irl.hu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKBNKZUIYWUGLX7EXKO6NHYB35XELHSR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

The Lenovo Yoga Slim Pro 9 14IRP8 has tas2781 amplifiers, but it can
only pickup its fixup with the hda_model=3D17aa:38be module parameter.

The 17aa:38be is the SSID of its Codec. The PCI SSID is 17aa:3802.

The patch_realtek.c has these fixup:
SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga DuetITL 2021",
ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
SND_PCI_QUIRK(0x17aa, 0x38be, "Yoga S980-14.5 proX YC Dual",
ALC287_FIXUP_TAS2781_I2C),

And the snd_hda_pick_fixup() picks the former fixup because of the same
PCI SSID, but that is a Codec SSID?

At least it worked without that line.
https://bugzilla.kernel.org/show_bug.cgi?id=3D208555#c839

It would be nice if it can be work without the module parameter.

What is the best way to add this strangeness to patch_realtek.c?

Thanks,
Gergo

