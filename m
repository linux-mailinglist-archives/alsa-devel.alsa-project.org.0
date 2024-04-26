Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A98B400D
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 21:19:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2602784D;
	Fri, 26 Apr 2024 21:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2602784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714159160;
	bh=438/ZQiq5iRawfVdd1FY58I+HIjcB9icOdPfLvQJQ6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BuouKMmD8DE8Mw5eRwCa8VpbAKI2a3OHvzcwXx49WYzEl6PLFxLVqA1nMT+lQZtPu
	 bkdvr8pkoYP0cacvL/W47oSggYG6y0+ceiJM/8+j2LoGjsQXXnZnK5h7evGNRtVcdG
	 jqS6PwyxgQyq6eoVi8RlYHoXHc/erKyOhreqPG8I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F758F8057C; Fri, 26 Apr 2024 21:18:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90998F8059F;
	Fri, 26 Apr 2024 21:18:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99773F802E8; Fri, 26 Apr 2024 21:18:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2110BF8003A
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 21:18:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2110BF8003A
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id AE71E100FC294;
	Fri, 26 Apr 2024 21:18:15 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 5EEC3AF872; Fri, 26 Apr 2024 21:18:15 +0200 (CEST)
Date: Fri, 26 Apr 2024 21:18:15 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Dan Williams <dan.j.williams@intel.com>
Cc: gregkh@linuxfoundation.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Marc Herbert <marc.herbert@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-coco@lists.linux.dev, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
Message-ID: <Ziv9984CJeQ4muZy@wunner.de>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
 <ZiYrzzk9Me1aksmE@wunner.de>
 <662beb6ad280f_db82d29458@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <662beb6ad280f_db82d29458@dwillia2-xfh.jf.intel.com.notmuch>
Message-ID-Hash: AUEUBRITQMRY7AW4CFGNJXWNGGIELKMF
X-Message-ID-Hash: AUEUBRITQMRY7AW4CFGNJXWNGGIELKMF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUEUBRITQMRY7AW4CFGNJXWNGGIELKMF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 26, 2024 at 10:59:06AM -0700, Dan Williams wrote:
> Lukas Wunner wrote:
> > > --- a/fs/sysfs/group.c
> > > +++ b/fs/sysfs/group.c
> > > @@ -33,10 +33,10 @@ static void remove_files(struct kernfs_node *parent,
> > >  
> > >  static umode_t __first_visible(const struct attribute_group *grp, struct kobject *kobj)
> > >  {
> > > -	if (grp->attrs && grp->is_visible)
> > > +	if (grp->attrs && grp->attrs[0] && grp->is_visible)
> > >  		return grp->is_visible(kobj, grp->attrs[0], 0);
> > >  
> > > -	if (grp->bin_attrs && grp->is_bin_visible)
> > > +	if (grp->bin_attrs && grp->bin_attrs[0] && grp->is_bin_visible)
> > >  		return grp->is_bin_visible(kobj, grp->bin_attrs[0], 0);
> > >  
> > >  	return 0;
> > 
> > I'm wondering why 0 is returned by default and not SYSFS_GROUP_INVISIBLE.
> > 
> > An empty attribute list (containing just the NULL sentinel) will now
> > result in the attribute group being visible as an empty directory.
> > 
> > I thought the whole point was to hide such empty directories.
> > 
> > Was it a conscious decision to return 0?
> > Did you expect breakage if SYSFS_GROUP_INVISIBLE is returned?
> 
> Yes, the history is here:
> 
>     https://lore.kernel.org/all/YwZCPdPl2T+ndzjU@kroah.com/
> 
> ...where an initial attempt to hide empty group directories resulted in
> boot failures. The concern is that there might be user tooling that
> depends on that empty directory. So the SYSFS_GROUP_INVISIBLE behavior
> can only be enabled by explicit result from an is_visible() handler.
> 
> That way there is no regression potential for legacy cases where the
> empty directory might matter.

The problem is that no ->is_visible() or ->is_bin_visible() callback
is ever invoked for an empty attribute group.  So there is nothing
that could return SYSFS_GROUP_INVISIBLE.

It is thus impossible to hide them.

Even though an attribute group may be declared empty, attributes may
dynamically be added it to it using sysfs_add_file_to_group().

Case in point:  I'm declaring an empty attribute group named
"spdm_signatures_group" in this patch, to which attributes are
dynamically added:

https://github.com/l1k/linux/commit/ca420b22af05

Because it is impossible to hide the group, every PCI device exposes
it as an empty directory in sysfs, even if it doesn't support CMA
(PCI device authentication).

Fortunately the next patch in the series adds a single bin_attribute
"next_requester_nonce" to the attribute group.  Now I can suddenly
hide the group on devices incapable of CMA, because an
->is_bin_visible() callback is executed:

https://github.com/l1k/linux/commit/8248bc34630e

So in this case I'm able to dodge the bullet because the empty
signatures/ directory for CMA-incapable devices is only briefly
visible in the series.  Nobody will notice unless they apply
only a subset of the series.

But I want to raise awareness that the inability to hide
empty attribute groups feels awkward.

Thanks,

Lukas
