Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B09741DEB
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 04:05:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25F531ED;
	Thu, 29 Jun 2023 04:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25F531ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688004305;
	bh=2k1AWCmQuhGYPHF6PczZ4gH7+wRLgyhbmtKx96F/9Vo=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=A2oEiRDCFZFCvR4kT3AhmU0l/bHlsoMWiy3IvwnXTgEXdlQ2P940Q7E/DBPmYMLJ+
	 kmPMTaoYHSxImXOlAgcZS9al1/N1i2g+eHsJ5MtqaytMYl+3Cl1cN1tzKKhfEJV5RV
	 wG6+gEHlwKyR6sQgwJRNt4tLcYr42K0OCVy9U95M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 901BDF80431; Thu, 29 Jun 2023 04:03:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33458F80212;
	Thu, 29 Jun 2023 04:03:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EF5CF80246; Thu, 29 Jun 2023 04:03:48 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id C775AF800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 04:03:47 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Thu, 29 Jun 2023 02:03:47 -0000
Message-ID: 
 <168800422777.22.14097919444187982640@mailman-web.alsa-project.org>
In-Reply-To: <87leg3ekiw.wl-tiwai@suse.de>
References: <87leg3ekiw.wl-tiwai@suse.de>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: JD5BLJ2Q2QYJH62MNY34K2BM5UXOZOGM
X-Message-ID-Hash: JD5BLJ2Q2QYJH62MNY34K2BM5UXOZOGM
X-MailFrom: happy.debugging@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JVMCYYMVKCN7RB4Q7ZFX42OUE7VG7Q3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks again for your time to reply . I think my coin has dropped :-)

1 .So basically, we have GTB in the device descriptor and the FB information is an UMP call to the device by the ALSA driver.  "The device should provide both info, in somehow compatible ways."  . The process would be [a]. driver gets USB device descriptors,  [b]. driver issues USB call to retrieve  USB GTB descriptors and then [c] driver issues UMP stream call to retrieve the function block information. (if N/A, driver falls back on the GTB information). This information should be consistent with the groups defined in the GTB.
2. When creating the device descriptors and GTB descriptors based on the 2020 USB 2.0 spec, it should work ?  Would those port show up in ALSA or can only be access via /dev/umpC*D*
3. w/o duplicates with 2 GTB's and for 32 groups, for example, it would be 1st GTB has group 1~16 and 2nd GTB 17~23  ?. A FB could use the groups from both GTB's for example Group1  and 17.
4. If two functions uses all 16 groups, that would use up all 32 FB's , correct ?
