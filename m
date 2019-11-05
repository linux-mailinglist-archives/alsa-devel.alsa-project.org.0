Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BCAF026F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 17:15:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5132016AB;
	Tue,  5 Nov 2019 17:14:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5132016AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572970525;
	bh=e1Z6mm30wxaFfXL2GkRCAfF0eF+MHmn43vos2b7K9EM=;
	h=To:From:In-Reply-To:References:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uic3N7CDmwPPPY1+nLqRQtzsd9ySrMA9jPs06YjAEddvYlHx7BRti6AM7fmL7ak8u
	 9LRUZ/kFRz1hzgGJtBRftjTqUp0eB7O6ccCJnjPlOu6y1qIv5QIEnn6//+ZBiYTBLh
	 Hw5JhjKG9dHPfVa442477NHqOAH/rPtdsNPDd92M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B74B5F8049B;
	Tue,  5 Nov 2019 17:13:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 536B4F8049B; Tue,  5 Nov 2019 17:13:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=FORGED_SPF_HELO,
 KHOP_HELO_FCRDNS,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DD95F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 17:13:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD95F8015B
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19091488-1500050 for multiple; Tue, 05 Nov 2019 16:13:10 +0000
MIME-Version: 1.0
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 tiwai@suse.de
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191105161053.22958-1-kai.vehmanen@linux.intel.com>
References: <20191105161053.22958-1-kai.vehmanen@linux.intel.com>
Message-ID: <157297038783.18566.4452216868127032897@skylake-alporthouse-com>
User-Agent: alot/0.6
Date: Tue, 05 Nov 2019 16:13:07 +0000
Cc: Pan Xiuli <xiuli.pan@linux.intel.com>, lakshminarayana.vudum@intel.com,
 kai.vehmanen@linux.intel.com, jani.saarinen@intel.com
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: hdmi - add Tigerlake support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Quoting Kai Vehmanen (2019-11-05 16:10:53)
> Add Tigerlake HDMI codec support.
> 
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205379
> BugLink: https://bugs.freedesktop.org/show_bug.cgi?id=112171
> Cc: Pan Xiuli <xiuli.pan@linux.intel.com>
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

For thos watching,
https://patchwork.freedesktop.org/series/68972/#rev1
includes the revert so that this is tested. Not that the first run
through BAT tgl died too early to be conclusive.
-Chris
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
