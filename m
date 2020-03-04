Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A172E179BB3
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 23:23:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 276E91661;
	Wed,  4 Mar 2020 23:22:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 276E91661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583360607;
	bh=Wl2G/94fuboGJ7NzivSE8wbS35Nv1EjaicCHd2NIuP0=;
	h=Date:To:Subject:From:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YcVdmQjbx0qYBHUEUL6peYL3z8J60MfTWZpWyNjVK7jdPxCn2kNgN0Y0/Ou8OcaVC
	 UXPJ+z7XR8D3VJSKV2SKE4nU7NSKOnDmV7fO8VZ/P6YcnN/l1pCkzw/rafs85SwVV2
	 CxxGhl4cfhNRBImtRRW9QiSuI3e5RfaAJSf8VSjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37662F801EC;
	Wed,  4 Mar 2020 23:21:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DEA6F801ED; Wed,  4 Mar 2020 23:21:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D31D4F800D8
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 23:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D31D4F800D8
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 1C34C15AD790A;
 Wed,  4 Mar 2020 14:21:34 -0800 (PST)
Date: Wed, 04 Mar 2020 14:21:33 -0800 (PST)
Message-Id: <20200304.142133.2297314858740854355.davem@davemloft.net>
To: helgaas@kernel.org
Subject: Re: [PATCH v4 00/10] PCI: Add and use constant
 PCI_STATUS_ERROR_BITS and helper pci_status_get_and_clear_errors
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200304165904.GA231103@google.com>
References: <20200303.185937.1365050844508788930.davem@davemloft.net>
 <20200304165904.GA231103@google.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 04 Mar 2020 14:21:34 -0800 (PST)
Cc: alsa-devel@alsa-project.org, nic_swsd@realtek.com,
 linux-pci@vger.kernel.org, clemens@ladisch.de, tiwai@suse.com,
 stephen@networkplumber.org, netdev@vger.kernel.org, hkallweit1@gmail.com,
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

From: Bjorn Helgaas <helgaas@kernel.org>
Date: Wed, 4 Mar 2020 10:59:04 -0600

> On Tue, Mar 03, 2020 at 06:59:37PM -0800, David Miller wrote:
>> 
>> Bjorn, please review and let me know if it is OK to merge this via the
>> networking tree.
> 
> I acked the relevant patches and you're welcome to merge it via
> networking.  Thanks!

Ok, thanks.

Series applied to net-next.

Thanks again everyone.
