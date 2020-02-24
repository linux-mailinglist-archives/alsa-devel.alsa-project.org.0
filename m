Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 424BE16B5B7
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 00:35:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEE76168D;
	Tue, 25 Feb 2020 00:34:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEE76168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582587346;
	bh=kBphkUkAegHS+KlG8wikO5by4pdhcCtfIgBgxVxhVOs=;
	h=Date:To:Subject:From:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbKP9fVwKDBt0Arz3Fx55En6EKCKQly+WB/r32GkUs7Uc2dhZ/wl++lpm4loscdqZ
	 SNTT0J7gb0MtG59y+sGDZoaBIIJwP4sbJd9nqjwWj6XhQ2lPh6A+IOkv0jHV84wz5n
	 tuhNB2eSRdRUeZ9JGXLQJJ1gSpOtXyykPZQx6BUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B815EF800C6;
	Tue, 25 Feb 2020 00:34:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F1CBF8014E; Tue, 25 Feb 2020 00:34:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAAA6F800C6
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 00:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAAA6F800C6
Received: from localhost (unknown [50.226.181.18])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 50CCD124CE3F3;
 Mon, 24 Feb 2020 15:33:53 -0800 (PST)
Date: Mon, 24 Feb 2020 15:33:52 -0800 (PST)
Message-Id: <20200224.153352.364779446032996784.davem@davemloft.net>
To: hkallweit1@gmail.com
Subject: Re: [PATCH 0/9] PCI: add and use constant PCI_STATUS_ERROR_BITS
 and helper pci_status_get_and_clear_errors
From: David Miller <davem@davemloft.net>
In-Reply-To: <5939f711-92aa-e7ed-2a26-4f1e4169f786@gmail.com>
References: <5939f711-92aa-e7ed-2a26-4f1e4169f786@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 24 Feb 2020 15:33:53 -0800 (PST)
Cc: alsa-devel@alsa-project.org, nic_swsd@realtek.com,
 linux-pci@vger.kernel.org, clemens@ladisch.de, tiwai@suse.com,
 stephen@networkplumber.org, netdev@vger.kernel.org, bhelgaas@google.com,
 linux-kernel@vger.kernel.org, mlindner@marvell.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Mon, 24 Feb 2020 22:20:08 +0100

> Few drivers have own definitions for this constant, so move it to the
> PCI core. In addition there are several places where the following
> code sequence is used:
> 1. Read PCI_STATUS
> 2. Mask out non-error bits
> 3. Action based on set error bits
> 4. Write back set error bits to clear them
> 
> As this is a repeated pattern, add a helper to the PCI core.
> 
> Most affected drivers are network drivers. But as it's about core
> PCI functionality, I suppose the series should go through the PCI
> tree.

Heiner, something is up with this submission.

The subject line here says 0/9, but the patches say N/8 and patch #8 never
showed up on the list.

Sort out what this should be and resubmit, thank you.
