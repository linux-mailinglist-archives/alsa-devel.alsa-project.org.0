Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 295F3210B03
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 14:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C26AE1682;
	Wed,  1 Jul 2020 14:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C26AE1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593606467;
	bh=Nv4eozuzIRWQ00LKbcRdZ16BBjaXpDv2SmZ8B7PBl8M=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qZxUL4pohOVuvOkGG8tBDmBNt5FqzIFVqkLsEe/GKCRi+oJOBvQzuiIh8E5BSx9+w
	 ASxjViWXEPGpZqvakprmTTA28wIgC6m9iNQQPUZ+22kT7jjunZ91QWl5RTj/NIiTp9
	 +jP+XAbsgecrFz3nk66E6T/91idlEe52Nz46ZOpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C30CF800C1;
	Wed,  1 Jul 2020 14:25:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14125F80217; Wed,  1 Jul 2020 14:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B03DF80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 14:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B03DF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="HSxBmn44"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:
 cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e9GcZj7gH4lMtKXxtQnw4HiUVbZtf7yJJ7kltXFOfPY=; b=HSxBmn44VwAkOoIW3k5a+hDugC
 +vhhfaj5W8NaHoVO8VRa2Q5ZBILTdHM8J3Sd7BymH3uqfTdyf3QIT9Ug6Hiy6qJP/u+QlO7IwSzhz
 UfNSoB/EbRlj3Cos3fNJu4OlMF7G5Y40iHJaBpe9hVgZ4ugzZLeIUBG/e21Ahl9NlABMxZPgdd+j2
 ilbbY9G7+FoEcWyHRKwN7oz6uDxCOaK++J7etg1YXRW/F1bukJNqJUQbb1by7QXh9d6Hsubb+jAaa
 rX7mI4WqZMGB1qrBXUZ+T1NGbzxAFB7L1pjJa870pSkwV4QhC8wI3cnPPssiov9wv+eYW/YslHIRO
 m1j2wakw==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jqboG-0009jt-4V; Wed, 01 Jul 2020 13:25:52 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jqboF-0004bG-SO; Wed, 01 Jul 2020 13:25:51 +0100
Date: Wed, 1 Jul 2020 13:25:51 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: echoaudio: Fix some long standing bugs
In-Reply-To: <2006161409060.30751@stax.localdomain>
Message-ID: <2007011319580.23012@tamla.localdomain>
References: <2006161409060.30751@stax.localdomain>
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

Takashi, thank you for the feedback on the previous patches.

I will follow up with the final patches ready for merging. I've been 
running for many days now against kernel 5.6.14 with all issues resolved 
and no side effects.

I think it would be good to include these in a stable/LTS kernel. Is there 
some criteria, and can you assist with this?

Many thanks

-- 
Mark
