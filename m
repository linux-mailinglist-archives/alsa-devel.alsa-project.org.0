Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 144813DD065
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 08:20:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 765D217DE;
	Mon,  2 Aug 2021 08:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 765D217DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627885225;
	bh=2hT1dbd+DbZADbfQ8ZcZbzjzHg1SkBz/r/vNatVke8I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nMhBV7nweFJVUy2WWxhXIclNa6NLEVuqbbgHKfgBqcxzOfw371jNPmdE3cq4L1wCZ
	 inn5yIswgEN0E5JEJYOc2ygmZlhNjkios92fdQCCQAOQlbIGHq0o5iea5oHYvhV2a9
	 90ZaoGhPLF2G2KZQJJUS+LDyuBUmgp6NyE+nj4Ww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8564F801F7;
	Mon,  2 Aug 2021 08:18:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD30BF8025F; Mon,  2 Aug 2021 08:18:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67A00F800BF
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 08:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A00F800BF
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud8.xs4all.net with ESMTPA
 id ARHimHbd8XTlcARHjmgjNd; Mon, 02 Aug 2021 08:18:47 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 0DC7A1626FA;
 Mon,  2 Aug 2021 08:18:46 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id YHND6GR7eT-I; Mon,  2 Aug 2021 08:18:45 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 5BFFB162670;
 Mon,  2 Aug 2021 08:18:45 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id 4A71D16063C; Mon,  2 Aug 2021 08:18:45 +0200 (CEST)
Date: Mon, 2 Aug 2021 08:18:45 +0200
From: folkert <folkert@vanheusden.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: aconnect occasionally causes kernel oopses
Message-ID: <20210802061845.GQ890690@belle.intranet.vanheusden.com>
References: <20210801182754.GP890690@belle.intranet.vanheusden.com>
 <s5hlf5kz80e.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hlf5kz80e.wl-tiwai@suse.de>
Reply-By: Fri 16 Jul 2021 08:34:34 AM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfLtOrAk8W54wCt/eXCKWHTSA7QjXTVjW1zivVx+j6RC29LtxUUwRXmr4jOS/HuDvCVzVLcGICOjPCkNF5NhcnGCzW8nnY9rViFgvCydpE0QsbkPsxrGG
 cOnqActeOJtcMYNN/E+r8Z94IAxHC4a/ETPB53WD8yg/ucm3ZlvvUOsKkPovTImNrfJ5EYP3NAjJzG9EG+LHUL14341R53w57s0l+QjllONQR7UO5P4NTgQ9
 rkmPHeTE7AIOz5aOpSrElg==
Cc: alsa-devel@alsa-project.org
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

> In which situation?

I was testing something that listens for alsa events and for that I ran
a continuous loop that did:

while true
do
	aconnect 128:1 14:0
	aconnect -d 128:1 14:0
	aconnect -d 128:2 128:1
	aconnect 128:2 128:1
done

I ran 5 instances in parallel.

14 is midi through
128 is rtpmidi
