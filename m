Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 632E657F1B
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 11:19:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE70171F;
	Thu, 27 Jun 2019 11:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE70171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561627198;
	bh=FjPcVgaJQs24K9tDeO3i0RKGvRrwh61fUX9QKNlLYeE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TXFzotRu4FSiv9C2rGHdgIWxfKk87mcbMmmfClSn5PN+YK2PATVSIGQoSTkgEg56z
	 9sa7cjRikzP4+cxqlQn8jy+7Q9Jwj/OCuQagVqeY44Ynfa8FfgyV6PxS6GvYRHkAiI
	 XH+9D7o32ezd9IOKLbV0ydeszrHq+uf4e+I6vpIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 310F3F896FC;
	Thu, 27 Jun 2019 11:18:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF397F896F6; Thu, 27 Jun 2019 11:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEC0AF806F0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 11:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEC0AF806F0
Received: by mail-ot1-f67.google.com with SMTP id l15so1537551otn.9
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 02:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RYlPTdc+nSbVejl57wVgudRwjNsy7DxeSFbXCfQXb/Y=;
 b=rLJ/gTiaYLXDqtHPJfj/F9JIQbZWdjEQ9ioTdJg5TfjnStzVtjhkyRGvAgkLxQik73
 BAmuzm540JYDBFqiVSj+9zdjVqMixnK0bqSKlSG+88f7iE1VRciXN+j0Mw9x6Q1p2pWY
 FTYn4cMhOmjI/oljs+//M1JzXcspIj1YQ0d0nA3gdjU1gz9jF6dNDcmTXCPcF0XiyrHs
 WrW8Gw43wqO8gV+ozAcfBNq8bSdZKrW2CZVykfl7DVn6R2fhA+2iVSZTDUVgvcNpSTfO
 jeD8z7T4ISPbLCg5/yg6x/1ubxzyUAu92lBVyS7MSqYPpECKFRXlioIgSYWflk6zsrSC
 QWgw==
X-Gm-Message-State: APjAAAX2uv6HHNCMDCrrUT36+W1+WOFOrAbAQ6l3WOsWg4CaGG8x9jw8
 g2Pods7mb/7Oh8F70DytQvYV4F9a/CHTjdmh7po=
X-Google-Smtp-Source: APXvYqzrPV3cRJWCnDDd+ELRt78GEL9XyT/gQ4rbxjSThLFSFEzuf7U07F+wz0AhlBJcJNQJwPNp7QwOJKyhDSaQ0WI=
X-Received: by 2002:a9d:6959:: with SMTP id p25mr2402578oto.118.1561627086878; 
 Thu, 27 Jun 2019 02:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190626153611.10170-1-ckeepax@opensource.cirrus.com>
 <20190627001530.GG527@kroah.com>
In-Reply-To: <20190627001530.GG527@kroah.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Jun 2019 11:17:55 +0200
Message-ID: <CAJZ5v0g8or=OrEYBPE4K7k6P1ymAHOdwFaqZE9-Lr8eVp0hubg@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, patches@opensource.cirrus.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] device property: Add new array helper
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

On Thu, Jun 27, 2019 at 2:15 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jun 26, 2019 at 04:36:10PM +0100, Charles Keepax wrote:
> > It is fairly common to want to read an integer array property
> > that is composed of an unknown number of fixed size integer
> > groups. For example, say each group consists of three values
> > which correspond to the settings for one input on the device
> > and the driver supports several chips with different numbers
> > of inputs.
> >
> > Add a new helper function to provide this functionality, it
> > differs for the existing helpers in that it allows reading a
> > smaller number of values than the full array size and checks
> > that the number of values read is a multiple of the group size.
> >
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  drivers/base/property.c  | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/property.h |  2 ++
> >  2 files changed, 50 insertions(+)
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Well, I'm kind of not convinced about this one.

More comments in direct reply to the patch message.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
