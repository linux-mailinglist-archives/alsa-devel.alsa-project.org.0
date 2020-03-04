Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6258C1788D7
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 04:01:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E11C91614;
	Wed,  4 Mar 2020 04:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E11C91614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583290891;
	bh=UNtNCoaHEYNaUCLwCLha42WHcojBifGsddIweXRLHmc=;
	h=Date:To:Subject:From:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZOB4vCFRqQt+B0JX/UxgPUq1phVTdf8nAdw8xeNhXhEqBzb5ur4MxpiZcZGOMp/9
	 3ky7MHIyyljZHIem6b/DYdRCQtSLN1FMbTzJQCdfwt0Cj7IJYCqLF3eMlARMDWi/iu
	 9fYBtIzjBFkcKtZc5GKocfQbVuuoH03app3GRZ1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DADDF800D8;
	Wed,  4 Mar 2020 03:59:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F658F801ED; Wed,  4 Mar 2020 03:59:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74322F800D8
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 03:59:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74322F800D8
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 93D9F15AFD85F;
 Tue,  3 Mar 2020 18:59:39 -0800 (PST)
Date: Tue, 03 Mar 2020 18:59:37 -0800 (PST)
Message-Id: <20200303.185937.1365050844508788930.davem@davemloft.net>
To: hkallweit1@gmail.com
Subject: Re: [PATCH v4 00/10] PCI: Add and use constant
 PCI_STATUS_ERROR_BITS and helper pci_status_get_and_clear_errors
From: David Miller <davem@davemloft.net>
In-Reply-To: <adeb9e6e-9be6-317f-3fc0-a4e6e6af5f81@gmail.com>
References: <adeb9e6e-9be6-317f-3fc0-a4e6e6af5f81@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 03 Mar 2020 18:59:40 -0800 (PST)
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


Bjorn, please review and let me know if it is OK to merge this via the
networking tree.

Thank you.
