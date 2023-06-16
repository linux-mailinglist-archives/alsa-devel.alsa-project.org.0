Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E856E733356
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 16:18:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F0EF82A;
	Fri, 16 Jun 2023 16:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F0EF82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686925093;
	bh=IP30cDXMqq5iEhW0Ojg7hzkvARAiz4DsyJMnAeGTRYo=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=f0Rhn2Ul/KNQ14J0feHZnohJJTVYCjERKMmMYHJFKOerTEVoAqHB1rSRJPkUuXBz+
	 Rae8X+lm1FIqfIIVKxIkgh3gUNos2H3xVfbHs5iF9w2sngxnejgFDvvJIR7Yj18Tvk
	 04nti88p8mmCIFjP//6Ou25BhsM3mfyqeTjIFhT0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3394F8052E; Fri, 16 Jun 2023 16:17:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE73F800BA;
	Fri, 16 Jun 2023 16:17:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19329F80149; Fri, 16 Jun 2023 16:17:19 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FF1CF800BA
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 16:17:18 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Fri, 16 Jun 2023 14:17:18 -0000
Message-ID: <168692503857.22.5904642104496232941@mailman-web.alsa-project.org>
In-Reply-To: <87jzw37fti.wl-tiwai@suse.de>
References: <87jzw37fti.wl-tiwai@suse.de>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: EBEE5GQGPAFZSJACTX7R4GSUWJ7VEKC5
X-Message-ID-Hash: EBEE5GQGPAFZSJACTX7R4GSUWJ7VEKC5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBEE5GQGPAFZSJACTX7R4GSUWJ7VEKC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks a lot for the reply. I could try to re-base/backport the change onto the 6.2 kernel, but I am not very versed in git.. If there is a pointer to where how to do this backport, would be great. Now that I am on 6.4, the first step is to let the umpCxDx USB MIDI 2.0 device show up and then enumerate the ALSA ports (RAW or Sequencer) [ just C code] to find it there as well. P.S: I am not sure if this is the right place for the long conversation and support on this. I could create a server/channel on Discord.
