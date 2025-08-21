Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9611B2FD98
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Aug 2025 17:00:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC326023F;
	Thu, 21 Aug 2025 17:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC326023F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755788456;
	bh=eMbUUbcV6Y5As/TWRUeSOH3So1gE3EZp7WXwIDWGfOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s/p/vY4toFOOWipETaOpjUXuNra0KZYzM5q97A8N3ETtmAX9M8Rr8XPsMcSIM1NUD
	 Apg6esm/c2uZDaonZzmP+ey+GNq+cxPwM3FQvel6R4YMMpC91wbdoEBGq9pMUMhqra
	 YcKfBH6OCHbi8BPtV4KtajtJ6tQj7qt077YlmFP4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90E53F805C2; Thu, 21 Aug 2025 17:00:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6757DF805C2;
	Thu, 21 Aug 2025 17:00:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 662ADF80518; Thu, 21 Aug 2025 17:00:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED0ADF800ED
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 17:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED0ADF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=q8/71Qfd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CAAB408F2;
	Thu, 21 Aug 2025 15:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8385AC116C6;
	Thu, 21 Aug 2025 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755788405;
	bh=eMbUUbcV6Y5As/TWRUeSOH3So1gE3EZp7WXwIDWGfOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8/71QfdQy9fncU/xyfUgneWjwr219bSd81Y0UdLklUH2HbPJE6+D5T4gwUgcVWzW
	 egYbYFHKIa6ld82ka8vVqOasv/VWnLtppycnjRJ7RXQE3XHgQ7SSwp9W99ntCzFgEs
	 MHMXGgwdDP/M2qUUiyEMGtWW60sKNVSBPKnrm4YM=
Date: Thu, 21 Aug 2025 16:59:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "KATARE, SAURABH [EMR/MSOL/PUNE]" <saurabh.katare@emerson.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"tiwai@suse.de" <tiwai@suse.de>, "perex@perex.cz" <perex@perex.cz>,
	"Kulkarni, Pavan Kumar [EMR/MSOL/PUNE]" <pavankumar.kulkarni@emerson.com>,
	"Joshi, Tejesh [EMR/MSOL/PUNE]" <Tejesh.Joshi@emerson.com>,
	"Nagesh, Rahul [EMR/MSOL/PUNE]" <rahul.nagesh@emerson.com>
Subject: Re: Cybersecurity Risk Assessment Request from Emerson for Advanced
 Linux Sound Architecture (ALSA)
Message-ID: <2025082159-shrubbery-legwarmer-d9f3@gregkh>
References: 
 <DM4PR10MB68643A6D91F19668A31E0AA0802FA@DM4PR10MB6864.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <DM4PR10MB68643A6D91F19668A31E0AA0802FA@DM4PR10MB6864.namprd10.prod.outlook.com>
Message-ID-Hash: REZW5VFQU2FNC3V5MCXML4JNJFS23GPH
X-Message-ID-Hash: REZW5VFQU2FNC3V5MCXML4JNJFS23GPH
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/REZW5VFQU2FNC3V5MCXML4JNJFS23GPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 11, 2025 at 10:34:13AM +0000, KATARE, SAURABH [EMR/MSOL/PUNE] wrote:
> Hello,
> 
> 
> 
> I hope this message finds you well.
> 
> 
> 
> As part of our ongoing efforts to comply with the EU Cyber Resilience Act (CRA), we are currently conducting a cybersecurity risk assessment of third-party software vendors whose products or components are integrated into our systems.
> 
> To support this initiative, we kindly request your input on the following questions related to your software product "Advanced Linux Sound Architecture (ALSA)" with version v1.2.1.2. Please provide your responses directly in the table below and do reply to all added in this email,

Note, you do realize who you are asking for this information from,
right?  "ALSA" is NOT considered a manufacturer under the rules of the
CRA, and as such does NOT have to provide any of this information.

YOU are considered a manufacturer under the CRA, so YOU have to follow
the manufacturer rules of the CRA, not "ALSA". That's how the CRA works
when you incorporate open source software into your product.

So please go and work on your auditing and processes, they need a lot of
work.  I can't wait to see what you are going to do when you run across
the "Linux" package :)

If you have further questions, please let me know.  As I am on the CRA
Expert panel as a representitive for Linux and some other projects, I am
pretty familiar with this process.

thanks,

greg k-h
