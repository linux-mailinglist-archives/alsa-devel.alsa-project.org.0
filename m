Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB139D58B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 09:03:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59225167B;
	Mon,  7 Jun 2021 09:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59225167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623049426;
	bh=GEINSpW5fUx7axb542SfnzOMyEa5vKbHjeKmzPGsVec=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ePEVJiLW8iP+a0JcnQCgp/cGxwaIXHUYlzQvNgYvepBHXwgKtPgn8yYhCkJth9kmm
	 4srQWOKhYNViAJDDFiGBK5QbSSiujIhBHD2kuxoYO07tYoTFnDggy+Zae1LiSKE/VC
	 5ZSyZb3y7Vv3xl7OF6PFMLyY/0Ye4WlO2QomEky4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9891F8026C;
	Mon,  7 Jun 2021 09:02:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E576F80212; Mon,  7 Jun 2021 09:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,MIME_HTML_ONLY,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from prx2.chmail.ir (unknown [80.191.56.172])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BF8BF801EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 09:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF8BF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=chmail.ir header.i=@chmail.ir
 header.b="L3yKvjxc"
Received: from localhost (localhost.localdomain [127.0.0.1])
 by prx2.chmail.ir (Postfix) with ESMTP id 0218040DBC24
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 11:31:56 +0430 (+0430)
Received: from prx2.chmail.ir ([127.0.0.1])
 by localhost (prx2.chmail.ir [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8_yN7cCgUtzC for <alsa-devel@alsa-project.org>;
 Mon,  7 Jun 2021 11:31:51 +0430 (+0430)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by prx2.chmail.ir (Postfix) with ESMTP id C1FAB40DBC4A
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 11:31:51 +0430 (+0430)
DKIM-Filter: OpenDKIM Filter v2.10.3 prx2.chmail.ir C1FAB40DBC4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chmail.ir;
 s=chmailv; t=1623049311;
 bh=Dffm91JOLWjtJ4nnhSPHrzfWbLyfOoIaoe4Io+Sngpc=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=L3yKvjxcx1AHujzURnfzJNRi36cPPo84OTxABTVqml4rOjTxiH/642FJO33FEeH/k
 Rbu1FK+BSm5QT3+C/MVqmaSCxHhb6j/aWv9fk+6XuVJfQapL75uoPJeDTM1mUFwyi6
 qlHntZoCZeGkGPNX6rlE/3yGy6bWVThbOXJSDOiLiuULXCVY7RnOpnxI3FDTvC4UIh
 gD0LwqAeq2EDdupP/41Hu9KJyYzhnXT6tZw431Svq+StsqYIDWTflhv1i5l1qOA7pv
 X3snK3eM7fWn9r1CoRdYfuunqkeX7byLTfsbjVxtSdCT/BDv6EQJPS8k9vUgDwalbA
 7g3Dv3Y6rldsQ==
X-Virus-Scanned: amavisd-new at 
Received: from prx2.chmail.ir ([127.0.0.1])
 by localhost (prx2.chmail.ir [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LENe1CxyY5pB for <alsa-devel@alsa-project.org>;
 Mon,  7 Jun 2021 11:31:51 +0430 (+0430)
Received: from [192.168.1.146] (unknown [93.119.214.80])
 by prx2.chmail.ir (Postfix) with ESMTPA id 9442940DBC24
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 11:31:51 +0430 (+0430)
To: alsa-devel@alsa-project.org
From: Meghdad Moradi <meghdad.moradi@chmail.ir>
Subject: Possible ALSA bug: Cannot record via mic while PA is running
Message-ID: <9424b819-f35e-a857-c2ef-a852d14121a3@chmail.ir>
Date: Mon, 7 Jun 2021 11:31:42 +0430
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

   Hello,

   Please take a look at the following thread that I created some time
   ago:

   [1]https://ubuntuforums.org/showthread.php?t=2462882&p=14041574#post140
   41574

   I have included most relevant and useful info in the first and last
   post.

   pa-info output:

   [2]https://gist.github.com/no149/5c239626048a860a882f8d412013a4e6

   I'd provide further info, if it's needed.

References

   1. https://ubuntuforums.org/showthread.php?t=2462882&p=14041574#post14041574
   2. https://gist.github.com/no149/5c239626048a860a882f8d412013a4e6
