Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA9283F8A
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 21:23:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C433B17B1;
	Mon,  5 Oct 2020 21:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C433B17B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601925831;
	bh=Aahgpnwxc+ptkMZyefAlgA+//XP1VDX51HJ5VQzR7Qk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CULjFUMkFNcBQdP0VHXVBVtE8EtwZh6NbnUWZHjser3d5FkFPm4CZeYpLF6cHRLSb
	 ogQ081uVPJeGF/eI9Dfiaf8UdwvyxTZT1O1lrX3Ci6WfkmkaMyc1lXmbQrjcoNMJEJ
	 Q0w1L/Vntbvm+svzMXXFvJ8Bu0Xf5FYjNltpOgEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC063F800EF;
	Mon,  5 Oct 2020 21:22:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B947F8025A; Mon,  5 Oct 2020 21:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0025.hostedemail.com
 [216.40.44.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 550F2F80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 21:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 550F2F80121
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id CDE0518224D77;
 Mon,  5 Oct 2020 19:21:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: wall78_50031f1271c0
X-Filterd-Recvd-Size: 1640
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Mon,  5 Oct 2020 19:21:52 +0000 (UTC)
Message-ID: <714e5d92d8b9f3ba365ec0cabf1406ea1a847d69.camel@perches.com>
Subject: Re: [PATCH] sound: sparc: dbri: fix repeated word 'the'
From: Joe Perches <joe@perches.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Mon, 05 Oct 2020 12:21:51 -0700
In-Reply-To: <20201005191234.12715-1-rdunlap@infradead.org>
References: <20201005191234.12715-1-rdunlap@infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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

On Mon, 2020-10-05 at 12:12 -0700, Randy Dunlap wrote:
> Drop the duplicated word "the".
[]
> --- lnx-59-rc8.orig/sound/sparc/dbri.c
> +++ lnx-59-rc8/sound/sparc/dbri.c
> @@ -620,7 +620,7 @@ A circular command buffer is used here.
>  while another can be executed. The scheme works by adding two WAIT commands
>  after each sent batch of commands. When the next batch is prepared it is
>  added after the WAIT commands then the WAITs are replaced with single JUMP
> -command to the new batch. The the DBRI is forced to reread the last WAIT
> +command to the new batch. The DBRI is forced to reread the last WAIT

Maybe Then the?

>  command (replaced by the JUMP by then). If the DBRI is still executing
>  previous commands the request to reread the WAIT command is ignored.
>  

