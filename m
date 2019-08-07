Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF80843E8
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 07:40:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B32C851;
	Wed,  7 Aug 2019 07:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B32C851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565156429;
	bh=O+Gbc4E9Ex2HbrnvYFA6pp7tjCFGrGNekhowA6HNRVw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e9Ogz8ltFH5om06Oju4GFKgnl93fExVgoXISN7A8/X40azuyXH2glnN0H+00kX2j8
	 2IDhu6+tarZVlHTOMVgSJhDHVgSxL3e2nySxHJk4K60RnF/uvCGSJfyqwX8Z31Y/HR
	 eiwrtk1FSiO6HUMdcZ0JIWlXZ46zZgNHLdjHrbBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E892F804CA;
	Wed,  7 Aug 2019 07:38:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B41BF80290; Wed,  7 Aug 2019 07:38:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ajax.cs.uga.edu (ajax.cs.uga.edu [128.192.4.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05702F800E4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 07:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05702F800E4
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42]) (authenticated bits=0)
 by ajax.cs.uga.edu (8.14.4/8.14.4) with ESMTP id x775cYko059295
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <alsa-devel@alsa-project.org>; Wed, 7 Aug 2019 01:38:36 -0400
Received: by mail-lf1-f42.google.com with SMTP id c19so63060647lfm.10
 for <alsa-devel@alsa-project.org>; Tue, 06 Aug 2019 22:38:35 -0700 (PDT)
X-Gm-Message-State: APjAAAXf8nhC7DrSkalmCvdPihtXByBsu/fWaDnzSfTz/QDX2p4IkaZZ
 rgcJDUVU1iIKoXxt9uS90Og+GfhTJZDn4i0bfeo=
X-Google-Smtp-Source: APXvYqxn7QtGteg9YvLHOYoGnkl3CYUkFtn9ejBHDQojm0jJjJIbVpZPfk4ElTDYyWEwEe60vcFfHZndGWTZqq1jvOI=
X-Received: by 2002:a19:491d:: with SMTP id w29mr4833560lfa.149.1565156314615; 
 Tue, 06 Aug 2019 22:38:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAAa=b7ebEkQZhPCbJPK=dVC+cR8_pTE3OOxX+PV+MNx7-Y25Cw@mail.gmail.com>
 <s5hef1xo81o.wl-tiwai@suse.de>
In-Reply-To: <s5hef1xo81o.wl-tiwai@suse.de>
From: Wenwen Wang <wenwen@cs.uga.edu>
Date: Wed, 7 Aug 2019 01:37:58 -0400
X-Gmail-Original-Message-ID: <CAAa=b7cOAONyFVd=s19d+00gb9_CtECP59ZR_sc6z4z=BOVjEA@mail.gmail.com>
Message-ID: <CAAa=b7cOAONyFVd=s19d+00gb9_CtECP59ZR_sc6z4z=BOVjEA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Wenwen Wang <wenwen@cs.uga.edu>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Clemens Ladisch <clemens@ladisch.de>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-midi: fix a memory leak bug
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

On Wed, Aug 7, 2019 at 1:31 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 07 Aug 2019 05:22:09 +0200,
> Wenwen Wang wrote:
> >
> > In __snd_usbmidi_create(), a MIDI streaming interface structure is
> > allocated through kzalloc() and the pointer is saved to 'umidi'. Later on,
> > the endpoint structures are created by invoking
> > snd_usbmidi_create_endpoints_midiman() or snd_usbmidi_create_endpoints(),
> > depending on the type of the audio quirk type. However, if the creation
> > fails, the allocated 'umidi' is not deallocated, leading to a memory leak
> > bug.
> >
> > To fix the above issue, free 'umidi' before returning the error.
> >
> > Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
>
> It's again a false-positive report.  The object is released
> automatically by the destructor of its base snd_rawmidi object.

Thanks for your response! Sorry for the false positives. :(

Wenwen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
