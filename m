Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6BD6165D3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 16:16:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B50A1689;
	Wed,  2 Nov 2022 16:16:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B50A1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667402210;
	bh=VZDYBKFvBlOtHAfSwO0GE34rHPXlIQG1SllWYfsmI7o=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HWH1GROb11kE6vF4EE6Ha1Cztw8UXNv5om3H2ou85GbzW8C2LyfcE3uRDr2kZXnX8
	 QsYkG0HpWF5aB7uFb8INdwXGFkxpHlVe9XxZlX2o3tjlRLtJ7L3W6AKLsPEkFxTT0i
	 kYySoXZcFU8scoh+AwxnxyLLrIOl+P+rOhkavRyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62B13F80155;
	Wed,  2 Nov 2022 16:15:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28AEEF8026D; Wed,  2 Nov 2022 16:15:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 190BEF80085
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 16:15:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 190BEF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="i12fpuAl"
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 4789241099
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 16:15:45 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q8oK2IXWbw3R for <alsa-devel@alsa-project.org>;
 Wed,  2 Nov 2022 16:15:44 +0100 (CET)
Received: from ael by shelf.conquest with local (Exim 4.96)
 (envelope-from <ael@shelf.conquest>) id 1oqFSw-00029p-1a
 for alsa-devel@alsa-project.org; Wed, 02 Nov 2022 15:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1667402144; bh=VZDYBKFvBlOtHAfSwO0GE34rHPXlIQG1SllWYfsmI7o=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=i12fpuAl1vwfKzbHYpekWywVl2B6SKlIbbXqTDeOuGmty0uiVuOwfZ+69oMxccjNv
 bQZyG4rR17uoOwj6OToAc++PTaSuNweqAxpdGX+3VuMSQRVE3SpD+WYIRm1har6llm
 cckPGSZAQssYiD/gas8iUZf0AE3lv8ep6fXpz8IOaf+rd+/ICaeldyzdkzndVs1jxd
 OK219YIYW256DJa1/DIMmPKw9kOSd4bjmpJiql5f+A0C/H7jhs3pGcOczpCF6RSS+Y
 tDTCSzDmvrcc+7CsthH/3/HmmPhCxhqNBpZUIOEj4ISgcYiuAW/lY4HqUomdqP8LAu
 Q47Ab4vDU1q6g==
Date: Wed, 2 Nov 2022 15:15:42 +0000
From: ael <witwall3@disroot.org>
To: alsa-devel@alsa-project.org
Subject: Re: building aplay / arecord
Message-ID: <Y2KJntHXy19DEBck@shelf.conquest>
References: <CAG74igXPJjnQF6-nbXn2bXywWA0cKpR3cDhYPwg=fKN6J_yZZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG74igXPJjnQF6-nbXn2bXywWA0cKpR3cDhYPwg=fKN6J_yZZA@mail.gmail.com>
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

On Mon, Oct 31, 2022 at 06:04:26PM -0700, David Jaffe wrote:
> Newbie question...
> 
> I downloaded the alsa-utils source and it says to run ./configure.  But no
> such file exists.  And if I go to aplay and type “make aplay” it can’t find
> a file called “aconfig.h”, which is presumably written by
> ./configure.  What am I missing?

I think that you need to run autoconf on the configure.ac file which
you should have: it is there in the git directory.

Perhaps read 
 man autoconf ?

The INSTALL file does indeed say run ./configure without explaining that
you need autoconf if ./configure is not present.

ael

