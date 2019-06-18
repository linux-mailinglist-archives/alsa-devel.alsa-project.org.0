Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AC149955
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 08:51:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5B07170B;
	Tue, 18 Jun 2019 08:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5B07170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560840663;
	bh=Cx9BS3S5d3jwvYceEFVeCEPQtSso3UYTAcSndCHV51o=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HZ4hVkybxuDrnqXDSDBM31yB2IgzANd7Z1cAcSxBSGGDC60H4gk1YfpSfSyHf+1AD
	 4001OnTmeJdeT31pCZnnyXM70+581w1GqBn9UMe7ZUPC3ui75U+qY3iPb1WVsvpvXJ
	 PWC8+i1mSlzD6LUPRmmB8MiBe3RQUs22Yu9RiTbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66429F80CC4;
	Tue, 18 Jun 2019 08:49:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B58FDF896F4; Tue, 18 Jun 2019 08:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODYSUB_14, SPF_HELO_NONE, 
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C38CF80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 08:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C38CF80CC4
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id C67503C0149;
 Tue, 18 Jun 2019 08:49:08 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nq07OMMnpzRO; Tue, 18 Jun 2019 08:49:03 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 19C5E3C00BC;
 Tue, 18 Jun 2019 08:49:03 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289]) by
 HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289%12]) with mapi id
 14.03.0439.000; Tue, 18 Jun 2019 08:49:03 +0200
From: "Miartus, Adam (Arion Recruitment; ADITG/ESM)" <amiartus@de.adit-jv.com>
To: Takashi Iwai <tiwai@suse.de>
Thread-Topic: [ALSA patch] [PATCH 0/2] v2 pcm_file propagate write error
 instead	of an assert
Thread-Index: AQHVJZ9ictvEX4yOMkqz3VTaWItPWKag+CFA
Date: Tue, 18 Jun 2019 06:49:02 +0000
Message-ID: <B174E9FCEE9A8C46B11E4DF2E32993627A67B3@HI2EXCH01.adit-jv.com>
References: <1560322108-17074-1-git-send-email-amiartus@de.adit-jv.com>
 <s5hwohj9zhl.wl-tiwai@suse.de>
In-Reply-To: <s5hwohj9zhl.wl-tiwai@suse.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.92.142]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [ALSA patch] [PATCH 0/2] v2 pcm_file propagate
 write error instead	of an assert
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

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Dienstag, 18. Juni 2019 08:31
> To: Miartus, Adam (Arion Recruitment; ADITG/ESM) <amiartus@de.adit-
> jv.com>
> Cc: alsa-devel@alsa-project.org
> Subject: Re: [ALSA patch] [PATCH 0/2] v2 pcm_file propagate write error
> instead of an assert
> 
> On Wed, 12 Jun 2019 08:48:26 +0200,
> Adam Miartus wrote:
> >
> > patch possible case whenre file write causes assert in pcm_file
> > plugin, by reporting error to user and printing a message
> >
> > user has a chance to recover error state, or capture
> > correct logs before assert happens, and may have an idea how
> > to recover
> >
> > Adam Miartus (2):
> >   pcm_file: do not disrupt playback on output file write fail
> >   pcm_file: report write output file error to api user
> 
> The patches have been already merged.  Any reason for resend?
> 
> 
> thanks,
> 
> Takashi

This is request v2, Im not aware I sent it two times. If so, sorry for spam.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
