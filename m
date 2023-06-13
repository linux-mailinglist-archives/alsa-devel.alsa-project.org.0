Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8C872E711
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 17:24:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE9AAE80;
	Tue, 13 Jun 2023 17:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE9AAE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686669843;
	bh=bToeTsHQ0aj1QtjpobNkrCu9ri0FGkVlPMqLMK/w664=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UjpxOL5d7YcKFXESbYvC4+MbQWMFmZf+HJQjP/kccIHMIl9aORyBMqN049TQnwmLJ
	 2lSlWaI4C0jxF4vm4P6O3pgEP8FUTbT+i82GzlqpFwtOK1Pc3Jal0/1G0En9UK598/
	 dYRNo9pGdbKWpB+acSOEBdVUkuzgwM+n5MKn1z3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1646EF8052E; Tue, 13 Jun 2023 17:23:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0B8DF80132;
	Tue, 13 Jun 2023 17:23:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7C3BF80149; Tue, 13 Jun 2023 17:23:07 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FB51F80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 17:23:07 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Tue, 13 Jun 2023 15:23:07 -0000
Message-ID: <168666978762.22.2520238479965266775@mailman-web.alsa-project.org>
In-Reply-To: <87edmfpjyg.wl-tiwai@suse.de>
References: <87edmfpjyg.wl-tiwai@suse.de>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 6NLFCH6Z4OCGUIZWCOIUGXEKM6N4JKQH
X-Message-ID-Hash: 6NLFCH6Z4OCGUIZWCOIUGXEKM6N4JKQH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NLFCH6Z4OCGUIZWCOIUGXEKM6N4JKQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

So great that the Linux community got involved early. :-)  Mailer issue resolved, It seems it needs some time to take effect.
"You can send an UMP packet" => it means to the raw midi device /dev/snd/umpC*D* ? That is not via an ALSA API call  (yet) ?
