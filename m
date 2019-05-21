Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74924A8E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 10:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E00441;
	Tue, 21 May 2019 10:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E00441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558427989;
	bh=GhOsCvF48NtBiCzU7ROdspEXPExYlR7NuRYa68RB/nM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bDRbtcrPPIZMDRcN30CQSRXUlvM8fTLBcAjxtS/woil9rNRlWUSWtEvMLR5UDnbMI
	 fWqPG7eb+5JQHuMT0iXMAZM9DqOS+s5ZABSRQrHVcH+QYtXixbhoGpoTl6HRA5+PwU
	 iTEA+aKDqxWjx6rGyDZv3eA/iJZTxvi9tu5X3198=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52378F89674;
	Tue, 21 May 2019 10:38:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD170F89674; Tue, 21 May 2019 10:37:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODYSUB_14, SPF_HELO_NONE, 
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13A90F806E7
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 10:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A90F806E7
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 177F63C00D1;
 Tue, 21 May 2019 10:37:50 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8BMlA22y7aGB; Tue, 21 May 2019 10:37:43 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id AB4803C005E;
 Tue, 21 May 2019 10:37:43 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289]) by
 HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289%12]) with mapi id
 14.03.0439.000; Tue, 21 May 2019 10:37:43 +0200
From: "Miartus, Adam (Arion Recruitment; ADITG/ESM)" <amiartus@de.adit-jv.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [ALSA patch] [PATCH - alsa-lib 4/4] pcm_file: add infile read
 support for mmap mode
Thread-Index: AQHVDyutarbUY62QJEaduReI7noFWKZ0OgDAgADjKgCAACRCwA==
Date: Tue, 21 May 2019 08:37:43 +0000
Message-ID: <B174E9FCEE9A8C46B11E4DF2E329936277F364@HI2EXCH01.adit-jv.com>
References: <1558370831-15960-1-git-send-email-adam.miartus@gmail.com>
 <1558370831-15960-4-git-send-email-adam.miartus@gmail.com>
 <B174E9FCEE9A8C46B11E4DF2E329936277F234@HI2EXCH01.adit-jv.com>
 <s5hwoik5i7d.wl-tiwai@suse.de>
In-Reply-To: <s5hwoik5i7d.wl-tiwai@suse.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.92.142]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [ALSA patch] [PATCH - alsa-lib 4/4] pcm_file: add
 infile read support for mmap mode
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

> On Mon, 20 May 2019 18:51:06 +0200,
> Miartus, Adam (Arion Recruitment; ADITG/ESM) wrote:
> >
> > From: Adam Miartus <amiartus@de.adit-jv.com>
> >
> > mmap_begin callback is used to copy data from input file to mmaped
> > buffer
> >
> > guard for corner use of api (multiple mmap_begin calls by user) is
> > introduced to check if next continuous buffer was already overwritten
> >
> > buffer is overwritten with input file data only in case of stream
> > capture
> >
> > Signed-off-by: Adam Miartus <amiartus@de.adit-jv.com>
> > Reviewed-by: Timo Wischer <twischer@de.adit-jv.com>
> 
> Can't we copy the data in snd_pcm_file_mmap_commit() just like the
> playback case?
> 
> 
> thanks,
> 
> Takashi

My understanding is that in case of reading data in mmap mode user
would call mmap_begin, read the buffer and then call mmap_commit.

In this case overwriting the buffer in mmap_commit with data from
Input file would be too late. 

Best regards,
Adam
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
