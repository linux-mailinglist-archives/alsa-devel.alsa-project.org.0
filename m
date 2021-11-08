Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B48A9449879
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 16:33:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 276FA166A;
	Mon,  8 Nov 2021 16:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 276FA166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636385629;
	bh=1WE3UJ+nu4NARwMJyr8tBEsSfFIJsB7R0ginr417ZQ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b2qbPgpjsUuEE+riPMURBn+7KG6E1D3JbNjWMXoNHmUtGobSjFn0pYieuV6yGVEwf
	 8G5g7jOEfqtCovkVEdqw8gA0vDUQ6oyaz1NtwRbRcgNVHnYmqbhs9Yeq/L2bfgmLBp
	 tXeWT2U6Uv+/8Gfrw+aqN8aHx/bDI95p2UvnD4tE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 999C9F80510;
	Mon,  8 Nov 2021 16:30:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12AF5F8049E; Mon,  8 Nov 2021 15:17:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id 513DCF8007E
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 15:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 513DCF8007E
Received: (qmail 1667203 invoked by uid 1000); 8 Nov 2021 09:17:03 -0500
Date: Mon, 8 Nov 2021 09:17:03 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v0 00/42] notifiers: Return an error when callback is
 already registered
Message-ID: <20211108141703.GB1666297@rowland.harvard.edu>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101924.15759-1-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108101924.15759-1-bp@alien8.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 08 Nov 2021 16:29:17 +0100
Cc: alsa-devel@alsa-project.org, x86@kernel.org, linux-sh@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 netdev@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>,
 sparclinux@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Rohit Maheshwari <rohitm@chelsio.com>,
 linux-staging@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gvt-dev@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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

On Mon, Nov 08, 2021 at 11:19:24AM +0100, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> Hi all,
> 
> this is a huge patchset for something which is really trivial - it
> changes the notifier registration routines to return an error value
> if a notifier callback is already present on the respective list of
> callbacks. For more details scroll to the last patch.
> 
> Everything before it is converting the callers to check the return value
> of the registration routines and issue a warning, instead of the WARN()
> notifier_chain_register() does now.

What reason is there for moving the check into the callers?  It seems 
like pointless churn.  Why not add the error return code, change the 
WARN to pr_warn, and leave the callers as they are?  Wouldn't that end 
up having exactly the same effect?

For that matter, what sort of remedial action can a caller take if the 
return code is -EEXIST?  Is there any point in forcing callers to check 
the return code if they can't do anything about it?

> Before the last patch has been applied, though, that checking is a
> NOP which would make the application of those patches trivial - every
> maintainer can pick a patch at her/his discretion - only the last one
> enables the build warnings and that one will be queued only after the
> preceding patches have all been merged so that there are no build
> warnings.

Why should there be _any_ build warnings?  The real problem occurs when 
a notifier callback is added twice, not when a caller fails to check the 
return code.  Double-registration is not the sort of thing that can be 
detected at build time.

Alan Stern

> Due to the sheer volume of the patches, I have addressed the respective
> patch and the last one, which enables the warning, with addressees for
> each maintained area so as not to spam people unnecessarily.
> 
> If people prefer I carry some through tip, instead, I'll gladly do so -
> your call.
> 
> And, if you think the warning messages need to be more precise, feel
> free to adjust them before committing.
> 
> Thanks!
