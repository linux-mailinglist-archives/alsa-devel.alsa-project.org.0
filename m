Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FF06F64FF
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 08:29:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B377F181F;
	Thu,  4 May 2023 08:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B377F181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683181794;
	bh=O/zIV3475nB7FF5ef5MOqbZv5j46UUPZL6FV0EFvYgs=;
	h=Resent-From:Resent-Date:Resent-To:From:To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RluY5UDCLGh4MM2/LiM8id6Tdt9/VBFmo5iGxrgF4juin8Ypz7uapGZjYLwEeHwYf
	 aVSF1Zps8qgUfQO2dskOx2Ikrdh0SnwzRu86HM4hJaVNIjI1DiOGZG70PZSY8fgn62
	 09vWDxHxUdYz14psyo5973+elVLuDfary/1vLfi8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDC3DF80114;
	Thu,  4 May 2023 08:29:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE660F8057C; Wed,  3 May 2023 13:35:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5ACC9F80579
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 13:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ACC9F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qg3L4IXt
Received: from zn.tnic (p5de8e8ea.dip0.t-ipconnect.de [93.232.232.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id
 C99901EC01A9
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 13:35:15 +0200 (CEST)
Resent-From: Borislav Petkov <bp@alien8.de>
Resent-Date: Wed, 3 May 2023 13:35:11 +0200
Resent-Message-ID: <20230503113511.GBZFJG7xsObjEjrB91@fat_crate.local>
Resent-To: alsa-devel@alsa-project.org
Received: from deliver ([unix socket])
	 by localhost (Cyrus v2.4.17-caldav-beta9-Debian-2.4.17+caldav~beta9-3) with
 LMTPA;
	 Wed, 03 May 2023 13:25:13 +0200
X-Sieve: CMU Sieve 2.4
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPS id 7B59C1EC01A9
	for <bp@alien8.de>; Wed,  3 May 2023 13:25:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2552D62B3E
	for <bp@alien8.de>; Wed,  3 May 2023 11:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E211C4339E
	for <bp@alien8.de>; Wed,  3 May 2023 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683113111;
	bh=O/zIV3475nB7FF5ef5MOqbZv5j46UUPZL6FV0EFvYgs=;
	h=From:To:Subject:Date:From;
	b=qg3L4IXtkMohZX6o9i+uv2ET3lSfWQ/FMmoAlUEyu+kPqvoNvR3t5gGliDLcSBdTM
	 NjJCNngg+qIfx3flQ5zfZRbMZCEngeXytNlUMrmP5MvAX2pSIQ02rMge/fIWKq4iY6
	 hhaBAIAKvQlnb6Bps+nSg+fH0ClmPRAX3NZusm4fp4ljFx+Oh4z76RLVvYRF2KWzkD
	 crJhYXhnXN8l0Rt39oU8xSGomtFqrtIZ1RBHfn4FdqdZey9De5HXCrJkmp9l4s/mC/
	 xJWNfPzvX9qzSI/q2hWxZRYQ+C+tqNwZmo/emSM9yC00bc8sC2cahoBIFfGF6ETZJl
	 t02UsV5SHy1XA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48)
	id 79945C43145; Wed,  3 May 2023 11:25:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: bp@alien8.de
Subject: [Bug 217395] New: Internal Speakers do no work ALC245 HP envy x360
 2-in-1 Laptop 13-bf0xxx
Date: Wed, 03 May 2023 11:25:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_x86_64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sourabhsagar7601@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_x86_64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217395-6385@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Authentication-Results: mail.skyhub.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=qg3L4IXt;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (mail.skyhub.de: domain of bugzilla-daemon@kernel.org designates
 2604:1380:4641:c500::1 as permitted sender)
 smtp.mailfrom=bugzilla-daemon@kernel.org
X-Spamd-Bar: ------
X-MailFrom: bp@alien8.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QA6DANNS5JW53MTCDFAXLYBPVW5GIDHE
X-Message-ID-Hash: QA6DANNS5JW53MTCDFAXLYBPVW5GIDHE
X-Mailman-Approved-At: Thu, 04 May 2023 06:28:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QA6DANNS5JW53MTCDFAXLYBPVW5GIDHE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D217395

            Bug ID: 217395
           Summary: Internal Speakers do no work ALC245 HP envy x360
                    2-in-1 Laptop 13-bf0xxx
           Product: Platform Specific/Hardware
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: x86-64
          Assignee: platform_x86_64@kernel-bugs.osdl.org
          Reporter: sourabhsagar7601@gmail.com
        Regression: No

Created attachment 304206
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304206&action=3Dedit
Error logs from dmesg

I have tried both Vanilla kernel and distro kernel. Still no sound from spe=
aker
Attaching output of a) uname -a, b) inxi -Fxz, c) journalctl -k | grep -Ei
"ALSA|HDA|sof[-]|HDMI|snd[_-]|sournd|hda.codec|hda.intel"



https://askubuntu.com/questions/1465753/ubuntu-23-04-no-speaker-sound-with-=
realtek-alc245-on-hp-envy-laptop

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
