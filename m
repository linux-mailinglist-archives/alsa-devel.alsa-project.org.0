Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA3028689
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 21:13:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22043166D;
	Thu, 23 May 2019 21:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22043166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558638787;
	bh=+Cw9vawso+KF2WjgBS2O4l+n9DNM2MPq7eEKNt5IxpY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p4/FYriIge9lWUsHeGcqkwd+TizqqGXezVkTkyNBtMsw6+70pr6YWUWJE1RZGBw09
	 RLgafKTOmx0TBDTTQv6sWYBK4Mbb7SYmAcevCoE6ynZskf8Tz9RS//wyKBJ2wis/oV
	 QeT6v7Ge9fw0//ycqR6L+30nq+pLALIJbN/M76Tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98FE7F89625;
	Thu, 23 May 2019 21:11:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9672F89674; Thu, 23 May 2019 21:11:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from malenstwo.juszkiewicz.com.pl (malenstwo.juszkiewicz.com.pl
 [37.187.99.30]) by alsa1.perex.cz (Postfix) with ESMTP id 65F20F8079B
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 21:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65F20F8079B
Received: from localhost (localhost [127.0.0.1])
 by malenstwo.juszkiewicz.com.pl (Postfix) with ESMTP id 608C8C057E
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 21:11:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from malenstwo.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (mail.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QihVe6T223sT for <alsa-devel@alsa-project.org>;
 Thu, 23 May 2019 21:11:15 +0200 (CEST)
Received: from puchatek.local (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by malenstwo.juszkiewicz.com.pl (Postfix) with ESMTPSA id CA739C034E
 for <alsa-devel@alsa-project.org>;
 Thu, 23 May 2019 21:11:14 +0200 (CEST)
To: alsa-devel@alsa-project.org
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Message-ID: <f4c9b563-af22-c351-47ee-9a748a9f4cc9@juszkiewicz.com.pl>
Date: Thu, 23 May 2019 21:11:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-GB
Subject: [alsa-devel] No sound on Asrock Z68 Extreme4
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

I recently moved my home machine to Asrock Z68 Extreme4 mainboard.
Booted into Fedora 30 and found out that my speakers are not making any
sound.

alsa-info.sh output:
http://alsa-project.org/db/?f=9c079d91b5f2278d3c3bd98518a6a717c86d31df

Pulseaudio says that are no speakers connected and 'hdajacksensetest'
says the same:

21:08 (0s) hrw@puchatek:~$ sudo hdajacksensetest
Pin 0x14 (Green Line Out, Rear side): present = No
Pin 0x15 (Black Line Out, Rear side): present = No
Pin 0x16 (Orange Line Out, Rear side): present = No
Pin 0x18 (Pink Mic, Rear side): present = No
Pin 0x1a (Blue Line In, Rear side): present = No

I noticed 'hdajackretask' tool but no idea how to use it properly.

Any ideas?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
