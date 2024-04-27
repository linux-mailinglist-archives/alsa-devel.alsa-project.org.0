Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 956B38B4849
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2024 23:15:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78052AE8;
	Sat, 27 Apr 2024 23:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78052AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714252513;
	bh=JLb9nkXBuq9tVxjgmesZjvdH2BXz28wXTyP7JHc7zJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ir0vBx3CNeAHibYeIGKHEldP07UxWHMY0LuVrOP4bll6zSzdv04q+5rZQOyt8cDM1
	 vyftCFjcBETe9RbX5dSyofkfPZNK5HrRp04fO0oGluE2/c22TZ21cyWxf7BbCIa6yw
	 cjohieSmh8XrQBxat21DNoigWhhYVyO/Mc5oeBl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B761F80587; Sat, 27 Apr 2024 23:14:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD96F805A1;
	Sat, 27 Apr 2024 23:14:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D788F80423; Sat, 27 Apr 2024 23:14:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1FF6F8003A
	for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2024 23:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1FF6F8003A
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id B9A7C2801371D;
	Sat, 27 Apr 2024 23:14:28 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 8C896190545; Sat, 27 Apr 2024 23:14:28 +0200 (CEST)
Date: Sat, 27 Apr 2024 23:14:28 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Dan Williams <dan.j.williams@intel.com>
Cc: gregkh@linuxfoundation.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Marc Herbert <marc.herbert@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-coco@lists.linux.dev, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
Message-ID: <Zi1qtKNwcyydP4c2@wunner.de>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
 <ZiYrzzk9Me1aksmE@wunner.de>
 <662beb6ad280f_db82d29458@dwillia2-xfh.jf.intel.com.notmuch>
 <Ziv9984CJeQ4muZy@wunner.de>
 <662d2ca522cc6_b6e02942d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <662d2ca522cc6_b6e02942d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Message-ID-Hash: GVF6UNHZC44T4XNMDZ2X6WR7IMLUEYFY
X-Message-ID-Hash: GVF6UNHZC44T4XNMDZ2X6WR7IMLUEYFY
X-MailFrom: foo00@h08.hostsharing.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVF6UNHZC44T4XNMDZ2X6WR7IMLUEYFY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Apr 27, 2024 at 09:49:41AM -0700, Dan Williams wrote:
> Lukas Wunner wrote:
> > But I want to raise awareness that the inability to hide
> > empty attribute groups feels awkward.
> 
> That is fair, it was definitely some gymnastics to only change user
> visible behavior for new "invisible aware" attribute groups that opt-in
> while leaving all the legacy cases alone.
> 
> The concern is knowing when it is ok to call an is_visible() callback
> with a NULL @attr argument, or knowing when an empty array actually
> means "hide the group directory".
> 
> We could add a sentinel value to indicate "I am an empty attribute list
> *AND* I want my directory hidden by default". However, that's almost
> identical to requiring a placeholder attribute in the list just to make
> __first_visible() happy.
> 
> Other ideas?

Perhaps an optional ->is_group_visible() callback in struct attribute_group
which gets passed only the struct kobject pointer?

At least for PCI device authentication, that would be sufficient.
I could get from the kobject to the corresponding struct device,
then determine whether the device supports authentication or not.

Because it's a new, optional callback, there should be no compatibility
issues.  The SYSFS_GROUP_INVISIBLE return code from the ->is_visible()
call for individual attributes would not be needed then, at least in my
use case.

Thanks,

Lukas
