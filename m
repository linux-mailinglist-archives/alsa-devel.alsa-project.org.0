Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C64341FB1CA
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 15:15:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66DD5167A;
	Tue, 16 Jun 2020 15:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66DD5167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592313345;
	bh=x3xBXCGIXIFy8QFkiuw3iBgnHvi0JEduiPCa2kSAbbs=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m0cUfH1Xagpmv+iF9KjhyO0g5UmY7YVKo8y1f5o/4Othalexewg1xvgqz5AeuMJrz
	 4oCl/95NXBOW1bLjftOw6rDFTIg52TWWkbXE+47EXs5wTHGcZJ4bY4cwZwDzGpzqTS
	 MYx0iTcbdEQ0kEfhgROeS4GUVa9r67zPMEMSHtbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C22DF80232;
	Tue, 16 Jun 2020 15:14:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3595DF8022B; Tue, 16 Jun 2020 15:14:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47BE4F800EF
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 15:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47BE4F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="bKLesEhJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:Message-ID:Subject:cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=k5mFIBwcg39v95mQN9MHXoY+DDa1DMJLmRFMcGkXZ1A=; b=b
 KLesEhJtOvFR0Niq7UrUBdnKMlGWBdwMx9VLQI4deTo9KQCjST2XvOgQm45wnomFQlzvuXkUdHsFI
 8iFSYo6pVzQlWJqbJyhfEVNZ1T0o8sh7JRFoSu4IO40OAttwfh4lRjRdE+I3vFgn8nAczoShj11uC
 ZBm2lfIDtuCLaTAhzt15ZBMez23nGISXEJT6p2BhwrahyLMWrFhmvQwoxlnoFg+oRCY5a+2Eg7Du2
 fOrAkm92GrYCtNcrZbrhhTX+oe5WPIxDSERbG4NofR8/62Gu0R/ROS4uOHAqZPG+DtCFl6b4J1B2E
 Ibere3ul82lWRifAMbeyD5uvjfUhJ6vQA==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93.0.4 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jlBPZ-000MX1-38; Tue, 16 Jun 2020 14:13:57 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jlBPY-0007Mv-QS; Tue, 16 Jun 2020 14:13:56 +0100
Date: Tue, 16 Jun 2020 14:13:56 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: echoaudio: Fix some long standing bugs
Message-ID: <2006161409060.30751@stax.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Here follows some patches for the echoaudio PCM handling.

Tested on the Layla3G on x86-64. I do have a Darla somewhere, but it's not 
practical for me to test with that right now.

-- 
Mark
