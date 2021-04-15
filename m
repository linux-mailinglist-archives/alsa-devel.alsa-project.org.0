Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ACE36147B
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 00:03:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 803E91675;
	Fri, 16 Apr 2021 00:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 803E91675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618524191;
	bh=94eLtrbtDJ2ia0wyZLrf7aZHbGVJj5sRpW54MKuu2Y4=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MwDgwHXeh1Fs3/jvwDRuk9PgOLKkm5w5ml4Vxb/sb2u7RGp022l3EG9/5ixdmUiY1
	 0oaDTqVz/PdY4pq9a0alSEwFqfKhHygSetTgVPoPT9Pc6aFfQ/tq8Da00s3N3cl9B8
	 0YotMVOHn2d+XyuqTSEzjyIbqGwTTaQrY3zL03m0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7493F8022D;
	Fri, 16 Apr 2021 00:01:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6BE0F8022B; Fri, 16 Apr 2021 00:01:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 810E1F80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 00:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 810E1F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=philcalvin.com header.i=phil@philcalvin.com
 header.b="IlkNil5U"
ARC-Seal: i=1; a=rsa-sha256; t=1618524090; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=I8l9+qWr4j2XzpPm+UBU80z+DocZ8nSrNPWqCvhPgqhjSMnR6xuNR6NtbG/oPVpIgayIFWaOiwTKprZornsp8BzI8YufAvz0aAGqhVGzMYfkCdXFtlekpuZ5LIqbWS6BSe0rGonPQ8+7ukENZqT2fpy9b4kXgpx5odro3bTGAn0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1618524090;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=0fESZPincc5ScimVXH0TaES2C2V7PDr2LOZxpXf868Q=; 
 b=ON6MsOgTszLuZI6LzTB7g2IwNQ5dQ2KXAkbitNzWUdkwbxqUOLyyHVz8wbQctK4gRylP8GxICNimzhI2EGQTKhoEqH+5NwTBSe5KKKdfsisVvSk7kEq83UoClAJkWXW7dHO66F023YOE7/LYcxQbGFmx3sCReCvhWnOpSkgZuqw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=philcalvin.com;
 spf=pass  smtp.mailfrom=phil@philcalvin.com;
 dmarc=pass header.from=<phil@philcalvin.com> header.from=<phil@philcalvin.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1618524090; 
 s=default; d=philcalvin.com; i=phil@philcalvin.com;
 h=From:Subject:To:Cc:Message-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=0fESZPincc5ScimVXH0TaES2C2V7PDr2LOZxpXf868Q=;
 b=IlkNil5UvbQJA9vZ429Y3jBFYnqaI9Pz2bpPVbTYF0VTMp4sO0Fx2vUQ2+fI7IEw
 fQRpKA/TUj6uMzVf9cQCEVbBc0GCXt0q5Auxqc/mqquNgS4RJUfvrlUuts1SjHpoYtz
 0nMoaadHYG0w/2b7RlBC6GVg6T69/D8lByROIjZA=
Received: from [192.168.1.11] (pool-100-33-69-201.nycmny.fios.verizon.net
 [100.33.69.201]) by mx.zohomail.com
 with SMTPS id 16185240849781015.4744942160735;
 Thu, 15 Apr 2021 15:01:24 -0700 (PDT)
From: Phil Calvin <phil@philcalvin.com>
Subject: [PATCH 0/1] ALSA: hda/realtek: fix mic boost on Intel NUC 8
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Message-ID: <b2dc09b1-7668-138a-abee-738b5346ef2f@philcalvin.com>
Date: Thu, 15 Apr 2021 18:01:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

I realized that I mistakenly sent this patch only to the listserv,
and not directly to the relevant maintainers as I should have. I'm
sorry for my error and the resulting list noise!

A big thank you to everybody that helps maintain the Intel HDA
subsystem. It is a well-documented and clear codebase to enter as a
first-time kernel hacker. Thanks also to Dr. Iwai for `hda-emu`, which
saved me a lot of rebooting while testing.

I have tested the patch on this hardware both by recompiling the
relevant modules and running them with the 5.10 kernel distributed in
Debian `testing`, and atop the 5.12-rc6 kernel built with `make
deb-pkg`.

I could not decipher the ordering of the fixup tables, so I am of
course happy to move these around to fit the organizational scheme as
needed.

I'm not an EE, but I am inclined to think the upper two boost values
can probably be made to work by some kind of software workaround,
given that they do produce analog noise coming from something. If you
have any hunches about a possible workaround based on experience with
other similar codecs, please point me to those fixups on- or off-list
and I can try them out on my hardware.

Phil

Phil Calvin (1):
   ALSA: hda/realtek: fix mic boost on Intel NUC 8

  sound/pci/hda/patch_realtek.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)

-- 
2.30.2

