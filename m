Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F22474098F
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 08:54:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B61337F1;
	Wed, 28 Jun 2023 08:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B61337F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687935270;
	bh=KrX8r+j78f2TXBCOrHzs2O0tizuknYH7+27oRgeyJOM=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ipbDnyhDYj9y++G6+M2ZNQDn1B5BxKO46CRSAyzPB+uLS286edcPJeJX1mzKb3bkc
	 G0Cmd5AfiX6JiI3oVt+18po4QJosHOmevu1vijOxYCZ0OjWOupDaxAn/Gw/+umuUMc
	 jLROlU9tV3sKoOtZylq04OsJYPQgXOJJclrgzvrE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2884CF80535; Wed, 28 Jun 2023 08:53:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1F60F80212;
	Wed, 28 Jun 2023 08:53:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3CDAF80246; Wed, 28 Jun 2023 08:52:25 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F15EF80169
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 08:52:25 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 00/37] ALSA: Add MIDI 2.0 support
From: "Symbolic Debugger" <happy.debugging@gmail.com>
To: alsa-devel@alsa-project.org
Date: Wed, 28 Jun 2023 06:52:25 -0000
Message-ID: <168793514562.22.9016848490888615032@mailman-web.alsa-project.org>
In-Reply-To: 
 <168726778987.22.3291129206408701069@mailman-web.alsa-project.org>
References: <168726778987.22.3291129206408701069@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: UQRR5CVGSJD6EBP6TPIVTLTQCK2VNVDS
X-Message-ID-Hash: UQRR5CVGSJD6EBP6TPIVTLTQCK2VNVDS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQRR5CVGSJD6EBP6TPIVTLTQCK2VNVDS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I have a few question on the implementation

1. As stated above:  So the driver may support multiple UMP Endpoints in theory, although most devices are supposed to have a single UMP EP that can contain up
to 16 groups -- which should be large enough.

I read (forgot where)  that Windows will  only supports 1 endpoint) . This would results in maximum 16 I/O ports when using one group terminal block per endpoint. Correct ? In that case manufacturers may not create  devices with multiple endpoints ... :-) ?

Per USB spec, One endpoint can support maximum 16 terminal blocks with each 16 groups so one endpoint in theory could support 256 (bi directional) groups and thus 512 ports (256 in/ 256 out)

2. If there is  one in and and out terminal  in an endpoint, then this will be presented as one in and one output port (in ALSA) ? Correct ?

3.  bGrpTrmBlkType: are 0x00, 0x01 and 0x02 all supported ?

4. At the MIDI device, should OUT endpoints be BULK,  and IN endpoints be INTERRUPT or BOTH BULK ? Page 21 of MIDI spec shows BULK for in and out but the descriptor example shows interrupt for IN. Page 19 states: MIDI Streaming Data Endpoints use bulk or interrupt transfers to exchange data with the Host

5. Are more than 1 Group Terminal Blocks supported by the driver for one endpoint ?

6. The current driver already uses the Group Terminal Blocks Descriptors Request ?
