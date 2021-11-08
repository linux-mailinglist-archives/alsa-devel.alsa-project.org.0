Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4C144A723
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 07:59:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B39B6168C;
	Tue,  9 Nov 2021 07:58:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B39B6168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636441179;
	bh=wDsye/TCRPdfw9F6BT48uhWeSk9Jm1FHAQm5pIjJtF8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pKJR/gp2gsoXOCwvjuCLP9zFDsg933fxx8Xb78/0+gJfcPeLgNQPKM2ZG7pYdm8tf
	 MYN24sI8i2Kbk3belFP/27Hrt5yb1fmOJnKB//AfCpfO2ZlZrncptYu1+vFcgxHjaf
	 2KGDYyUnGvd7GUMRCq3hF4RnCjADRhOqr6iT+7nU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71A44F804FC;
	Tue,  9 Nov 2021 07:57:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A7AFF8049E; Mon,  8 Nov 2021 17:30:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D237F801D8
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 17:30:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D237F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de
 header.b="pBzIQNPg"
Received: from zn.tnic (p200300ec2f331100181cb4ce2fe9e1de.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:181c:b4ce:2fe9:e1de])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 652D11EC0512;
 Mon,  8 Nov 2021 17:29:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1636388997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=OSbzA4U/ida8aXvLATS9A1smiSvQH5VirglC+wMEOMM=;
 b=pBzIQNPgz9f6MnJz8NuSpWeZa+X2KJ2EY1gkFfqIgUOOdk5ooj7nS3SZlOvvPfnLO1w7js
 1rE5oU8U3sZ2kD0zZzsPOjz5Rjy821j5ugVLv+TE7mQzDtZGil7p5QTxNJmqJYfQhl3i/U
 43Oeu8iAMBrtl8n9GGHPMyt/ODoo1Kk=
Date: Mon, 8 Nov 2021 17:29:55 +0100
From: Borislav Petkov <bp@alien8.de>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v0 00/42] notifiers: Return an error when callback is
 already registered
Message-ID: <YYlQg+OvUpUL630W@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101924.15759-1-bp@alien8.de>
 <20211108141703.GB1666297@rowland.harvard.edu>
 <YYkzJ3+faVga2Tl3@zn.tnic> <YYk1xi3eJdMJdjHC@zn.tnic>
 <20211108112313.73d0727e@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211108112313.73d0727e@gandalf.local.home>
X-Mailman-Approved-At: Tue, 09 Nov 2021 07:57:03 +0100
Cc: alsa-devel@alsa-project.org, x86@kernel.org, linux-sh@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 netdev@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>,
 sparclinux@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Rohit Maheshwari <rohitm@chelsio.com>,
 linux-staging@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 linux-um@lists.infradead.org, rcu@vger.kernel.org, linux-fbdev@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gvt-dev@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-renesas-soc@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
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

On Mon, Nov 08, 2021 at 11:23:13AM -0500, Steven Rostedt wrote:
> Question, how often does this warning trigger? Is it common to see in
> development?

Yeah, haven't seen it myself yet.

But we hashed it out over IRC. :-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
