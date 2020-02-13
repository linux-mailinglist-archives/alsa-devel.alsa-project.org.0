Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DBC15BDEF
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 12:45:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 966481678;
	Thu, 13 Feb 2020 12:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 966481678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581594340;
	bh=0PyksyO+G3myPgvl5vEhIalAvrvoEDOqWLs4Iud5e68=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pYzHBVaSRyvYr5qk+YSYKBB6OQYw8nA/FWyoHgUYxzWVAzHk6/Q5qDcU0ggij/ejP
	 5teu8Yy1wBiYJhOYMetjC7Q9koRQKZ/0rcyYDmn9oZc/HTzx9aOIKg/8TUsFFOy5J/
	 L5Xiqww9/WehSH4i9fbUJq2VJcy2ST0kRP479QO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9970F80139;
	Thu, 13 Feb 2020 12:43:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15FF3F80145; Thu, 13 Feb 2020 12:43:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from smtpo.poczta.interia.pl (smtpo.poczta.interia.pl
 [217.74.65.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6F79F80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 12:43:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6F79F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=interia.pl header.i=@interia.pl
 header.b="AAOrYEO6"
X-Interia-R: Interia
X-Interia-R-IP: 185.15.80.246
X-Interia-R-Helo: <photon>
Received: from photon (185-15-80-246.ksi-system.net [185.15.80.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
 Thu, 13 Feb 2020 12:43:53 +0100 (CET)
Date: Thu, 13 Feb 2020 12:43:52 +0100
From: Radoslaw Smigielski <radoslaw.smigielski@interia.pl>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200213114352.GA742571@photon>
References: <20200213103636.733463-1-radoslaw.smigielski@interia.pl>
 <s5ha75mrbyb.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5ha75mrbyb.wl-tiwai@suse.de>
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
 s=biztos; t=1581594234;
 bh=HMNQ0ByYostuHLzXcVPMAhsXuFIIt6ZWJhldOgLujpY=;
 h=X-Interia-R:X-Interia-R-IP:X-Interia-R-Helo:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Interia-Antivirus;
 b=AAOrYEO6R7Hn9ML3o/K6XyBmIXIZI7Ly2yKJcfedYXDVziYuujxykWtv9BRGtr9C5
 FpUswTD3tiYlaFDm6ClLr1LdyoDBuO4MsLHVSIKFUOIPHZnk7JRj+ilaT4AFJIQG4S
 TN3GkfpEmECy9gZICuJW1Qopqb98wprYHPyLYjWY=
Cc: alsa-devel@alsa-project.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, tiwai@suse.com, radoslaw.smigielski@interia.pl
Subject: Re: [alsa-devel] [PATCH] ALSA: doc: fix snd_hda_intel driver name
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

On Thu, Feb 13, 2020 at 11:58:04AM +0100, Takashi Iwai wrote:
> On Thu, 13 Feb 2020 11:36:37 +0100,
> Radoslaw Smigielski wrote:
> > 
> > Update driver name snd-hda-intel to proper, existing driver
> > name snd_hda_intel in Documentation/sound/hd-audio/notes.rst.
> 
> snd-hda-intel is correct from the module file name POV.
> Both are handled equivalently.
> 
> 
> thanks,
> 
> Takashi
> 

Takashi-san, I agree that the names with hyphens (snd-hda-intel)
are present in help sections of many options in sound/pci/hda/Kconfig.
But snd-hda-intel is confusing from end user point of view.
After reading notes.rst, end user is going to do someting like this:

    lsmod | grep snd-hda-intel

and this command gives false result.

Also this modprobe.conf file is not going to work but it's an existing
example in Documentation/sound/hd-audio/notes.rst:

> > -    options snd-hda-intel patch=on-board-patch,hdmi-patch


Cheers,
Radek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
