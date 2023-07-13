Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD22C751F52
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 12:55:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A6C91E7;
	Thu, 13 Jul 2023 12:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A6C91E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689245717;
	bh=U+uXS9v2Wp//H2UltV0PTn2glWkJwIcxBA0w92cxioQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cdo6aWk+pr/dXwi0aV7jZPyhtVFRUSpKdv4tvEBidS1KV82spIzrJW7lG4MuOVIRi
	 CrBFCGP7xcUvjD44tW3FuD4ljAR3VfmwMstgpHbIveLazN7vg0rz4Qht71quTZxeVd
	 8rXIpHMTglolKrIvreTegA9Eg9oCbWzESS1iOpqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74363F8024E; Thu, 13 Jul 2023 12:54:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41A4FF80236;
	Thu, 13 Jul 2023 12:54:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9BF5F80249; Thu, 13 Jul 2023 12:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A047F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 12:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A047F800E4
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 42D0E23E74;
	Thu, 13 Jul 2023 06:54:12 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qJtxb-kBa-00; Thu, 13 Jul 2023 12:54:11 +0200
Date: Thu, 13 Jul 2023 12:54:11 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 3/3] ALSA: emu10k1: (re-)add mixer locking
Message-ID: <ZK/X07ZfVZ+geigm@ugly>
References: <20230712145750.125086-1-oswald.buddenhagen@gmx.de>
 <20230712145750.125086-3-oswald.buddenhagen@gmx.de>
 <87jzv4fbxl.wl-tiwai@suse.de>
 <ZK++wAP6zYFFWvq6@ugly>
 <87edlcf9p9.wl-tiwai@suse.de>
 <ZK/LhwAr+uMMTFZZ@ugly>
 <875y6of6sj.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <875y6of6sj.wl-tiwai@suse.de>
Message-ID-Hash: INRHPKZZXD35OWPLNWAEEERKJWYEJEEF
X-Message-ID-Hash: INRHPKZZXD35OWPLNWAEEERKJWYEJEEF
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INRHPKZZXD35OWPLNWAEEERKJWYEJEEF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 13, 2023 at 12:24:28PM +0200, Takashi Iwai wrote:
>Well, I took your patch 3 just because you wanted to have a protection
>of your data from both get/put callback and from another code path in
>another patch.  It was an (ab)use of controls->rwsem that couldn't be
>accepted, so the patch 3 was taken as an alternative.
>
>If this isn't the scenario, let me know: I'd rather drop the patch
>again, as it's superfluous.
>
ok, then please drop it.

you're quite right that this is the scenario, but i can do that 
selectively just as well, like it already is the case in some other 
callbacks. i just wanted to have this patch first if it was to be 
applied at all, because it seemed cleaner.

regards
