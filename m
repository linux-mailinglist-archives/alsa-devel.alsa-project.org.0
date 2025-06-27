Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D88AEBE52
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 19:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACC69601FA;
	Fri, 27 Jun 2025 19:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACC69601FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751044695;
	bh=H2mvIWJTj2RF8L0OqyCXLvW8LLA8gQhh3m6sEilR8cs=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OJbWkAk1rFg+eR1nV6uEI0U9LrJW0pht8dv3mzlnueXRi/GYwTLyez6uNJQjNtT8S
	 UNsV/nXzdHY3pAMHN2De5qKZA967kYLbTu3dfini4Gw3FrxJv5/rlXRdC9r/H7j4qf
	 9YVvrekpENogLkkOrqyXJ+hy1TorJH5CDlhJEIMA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8987F8024C; Fri, 27 Jun 2025 19:17:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 834B1F805C5;
	Fri, 27 Jun 2025 19:17:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 956E0F80217; Fri, 27 Jun 2025 19:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.vandervlis.nl (mail.vandervlis.nl [91.198.178.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D515AF800FA
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 19:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D515AF800FA
Received: from localhost (localhost [127.0.0.1])
	by mail.vandervlis.nl (Postfix) with ESMTP id 36B111FD3C
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 19:17:46 +0200 (CEST)
Received: from mail.vandervlis.nl ([127.0.0.1])
	by localhost (mail.vandervlis.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6GcUTFKqgWg for <alsa-devel@alsa-project.org>;
	Fri, 27 Jun 2025 19:17:46 +0200 (CEST)
Received: from sioban.squirrel.nl (86-86-198-172.fixed.kpn.net
 [86.86.198.172])
	(Authenticated sender: johanvromans)
	by mail.vandervlis.nl (Postfix) with ESMTPSA id 0A3031FADD
	for <alsa-devel@alsa-project.org>; Fri, 27 Jun 2025 19:17:46 +0200 (CEST)
Received: from phoenix.squirrel.nl (phoenix.squirrel.nl [192.168.1.251])
	by sioban.squirrel.nl (Postfix) with ESMTP id 5697A9100AAF;
	Fri, 27 Jun 2025 19:17:45 +0200 (CEST)
Date: Fri, 27 Jun 2025 19:17:44 +0200
From: Johan Vromans <jvromans@squirrel.nl>
To: alsa-devel@alsa-project.org
Subject: [SOLVED] Re: Zoom R24 USB multichannel audio interface no longer
 recognized
Message-ID: <20250627191744.3885986b@phoenix.squirrel.nl>
In-Reply-To: <20250625154517.1e95463a@phoenix.squirrel.nl>
References: <20250625154517.1e95463a@phoenix.squirrel.nl>
Organization: Squirrel Consultancy
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: D65F7EMPE2GCQUY4VHPASAASJJEX4I2L
X-Message-ID-Hash: D65F7EMPE2GCQUY4VHPASAASJJEX4I2L
X-MailFrom: jvromans@squirrel.nl
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D65F7EMPE2GCQUY4VHPASAASJJEX4I2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Jun 2025 15:45:17 +0200, Johan Vromans <jvromans@squirrel.nl>
wrote:

> Recently I upgraded to Fedora 42 and now the device is presented as dumb
> 2-in/2-out USB audio interface.

Sorry, false alarm.

The R24 was connected via a KVM/USB switch, and that played tricks. After
connecting the R24 directly, or via a decent hub, the problem disappeared
and all channels are available again.

Apologies for the disturbance.
