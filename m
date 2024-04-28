Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 726C68B4B36
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2024 12:10:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA15B9F6;
	Sun, 28 Apr 2024 12:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA15B9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714299005;
	bh=TTARU/Xd9FlQOME2CIODtyLJRuvfgCO/Q3kMmgLEpAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZGo1rpBZG5TswSGNQ9qCVWmVklxbbz7+HYaxvYygOPFtaJ4Dx3oMUPU6X6q2m244/
	 Dzs7AT6dcOBJNqY5xsBpjvrmW7jChVEgF1c3ryktwfhBoMzGtSwhPqQMZGQJc74cND
	 muydiEHvhU31coQ6p7Ffgwif97D+b81kglSfM2lE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03803F8057E; Sun, 28 Apr 2024 12:09:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A8AFF8059F;
	Sun, 28 Apr 2024 12:09:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1852BF8028D; Sun, 28 Apr 2024 12:08:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC6C8F800B5
	for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2024 12:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC6C8F800B5
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 83873280072AE;
	Sun, 28 Apr 2024 12:08:43 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 4D1F555998; Sun, 28 Apr 2024 12:08:43 +0200 (CEST)
Date: Sun, 28 Apr 2024 12:08:43 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Dan Williams <dan.j.williams@intel.com>
Cc: gregkh@linuxfoundation.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Marc Herbert <marc.herbert@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-coco@lists.linux.dev, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
Message-ID: <Zi4gK8rs7jjdJOh8@wunner.de>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
 <ZiYrzzk9Me1aksmE@wunner.de>
 <662beb6ad280f_db82d29458@dwillia2-xfh.jf.intel.com.notmuch>
 <Ziv9984CJeQ4muZy@wunner.de>
 <662d2ca522cc6_b6e02942d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <Zi1qtKNwcyydP4c2@wunner.de>
 <662d6f24528d7_b6e0294d2@dwillia2-mobl3.amr.corp.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <662d6f24528d7_b6e0294d2@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Message-ID-Hash: NCCNODSC6KRVBIHJG2NXGI3FKG33CEYR
X-Message-ID-Hash: NCCNODSC6KRVBIHJG2NXGI3FKG33CEYR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCCNODSC6KRVBIHJG2NXGI3FKG33CEYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Apr 27, 2024 at 02:33:24PM -0700, Dan Williams wrote:
> Lukas Wunner wrote:
> > Perhaps an optional ->is_group_visible() callback in struct attribute_group
> > which gets passed only the struct kobject pointer?
> > 
> > At least for PCI device authentication, that would be sufficient.
> > I could get from the kobject to the corresponding struct device,
> > then determine whether the device supports authentication or not.
> > 
> > Because it's a new, optional callback, there should be no compatibility
> > issues.  The SYSFS_GROUP_INVISIBLE return code from the ->is_visible()
> > call for individual attributes would not be needed then, at least in my
> > use case.
> 
> That's where I started with this, but decided it was overkill to
> increase the size of that data structure globally for a small number of
> use cases.

Memory is cheap and memory-constrained devices can set CONFIG_SYSFS=n.

There aren't that many struct attribute_groups and this is just
8 additional bytes on a 64-bit machine.  (There are way more
struct attribute than struct attribute_group.)  The contortions
necessary to overload individual attribute ->is_visible() callbacks
to also govern the group's visibility aren't worth it.

Having an ->is_group_visible() callback has the additional benefit that
the mode of directories no longer needs to be hardcoded to 0755 in
sysfs_create_dir_ns(), but can be set to, say, 0500 or 0700 or 0511,
depending on the use case.  So more flexibility there as well.

Thanks,

Lukas
