Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A68ED745CA8
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 14:55:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6C23844;
	Mon,  3 Jul 2023 14:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6C23844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688388950;
	bh=QXPdIgEcNR0FLXTPCBEe5pRh+InALOn1rIFWeFeU8z4=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=K+Ls6TVKUHyDbRL9PFlyqX1p+uBVqOZckIoc1D6nX4WQJ8tL7ZH3AoOX/bp/O1hh7
	 XjTTDU9+j6lKueKlzbhk/DhmvhxzsIFZJsg1Po5+j34ZLbP0GeglhH51FBpiX72N7Q
	 nb8SWU9usQGQx/mR8pjh3b5/V95Se9Hif/Qymltg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 103A0F80558; Mon,  3 Jul 2023 14:54:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACFDCF80548;
	Mon,  3 Jul 2023 14:54:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CE51F80549; Mon,  3 Jul 2023 14:54:16 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 34477F80544
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 14:54:16 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Mon, 03 Jul 2023 12:54:16 -0000
Message-ID: 
 <168838885621.22.17021318227159318990@mailman-web.alsa-project.org>
In-Reply-To: <87fs655h89.wl-tiwai@suse.de>
References: <87fs655h89.wl-tiwai@suse.de>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: DN3B4EJF73FSSFI3HNJRKZHIJYIWXJR6
X-Message-ID-Hash: DN3B4EJF73FSSFI3HNJRKZHIJYIWXJR6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GTB3AEZJCOOLVK7TBRIV7IU6MYUSUBR6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Great !  Found the files. Thanks so much. BTW found the discrepancy. I downloaded the 1.2.9 alsa-lib (tar) files from the alsa website which did not have ump files as they do in the git 1.2.9 repo. I found this https://packages.ubuntu.com/search?keywords=asound  Seems libasound2-dev  is based on 1.2.9  but is for the next distro release (23.10) . Strangely, in the file list there are no ump files.
