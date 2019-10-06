Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22095CD16E
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Oct 2019 12:49:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D342166B;
	Sun,  6 Oct 2019 12:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D342166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570358976;
	bh=rAImRNYiTmTeHny0UxONJOk6+Kkqv+ot4N8HrK4nwi4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kEynlhxP+UJtHYKLLVjzXYWk0ZKT3T1qDlBgpg9mBYG8K2BUwxFbRhB3J4yAHluuV
	 v5WLFRBFtdG9RqXxmH01SmgktotGWv0A6Akt04+8+K2BQzTDTYzkLUlNXfTpzARp07
	 BXTjRQ/bAvhkGnJZEK+WRU7OTn1hwdO4bZ5sMicw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D83F80447;
	Sun,  6 Oct 2019 12:47:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 904F3F804CB; Sun,  6 Oct 2019 12:47:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A28BF80308
 for <alsa-devel@alsa-project.org>; Sun,  6 Oct 2019 12:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A28BF80308
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Oct 2019 03:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,263,1566889200"; d="scan'208";a="192019190"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu) ([10.252.41.73])
 by fmsmga008.fm.intel.com with ESMTP; 06 Oct 2019 03:47:16 -0700
Date: Sun, 6 Oct 2019 12:47:15 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Message-ID: <20191006104715.GA14691@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: [alsa-devel] what's the kernel policy WRT firmware parsing security?
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

Hi,

I decided to have a look at whether the ALSA topology parsing is bullet
proof against malformed topology files. It seems not quite to be the case.
At least I seem to have found a possibility of crashing the kernel by a
malformed topology file. I haven't tested it, so, maybe I'm wrong.

In principle, firmware files can only be written by root, and if you have
root access to the system, it's anyway doomed. Is this the approach and
we aren't really trying to make topology parsing 100% safe, or do we want
to fix any such possible parsing issues?

Thanks
Guennadi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
