Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 196B52D2C7F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 15:02:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D758216FA;
	Tue,  8 Dec 2020 15:01:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D758216FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607436149;
	bh=E+K1u7gdECLNQtGV9oBbV++1SW9aF7R7Y+KgSDmnO6M=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C9fCRgf+fvyb6cznELl9FGXpO2s5zOfiFbzfmL1uOmwT4yW3tLylJJ5BmDv90NgYv
	 EL9DCrUZxk51d+BB3rDvLYpEbsfs2/Vt4HQkJU+8czHxyyy/Mf1766eRlnRFuT4X/9
	 Jsg5V9VdQEmqlLcz6k90ZQCItg6dNUXEawFPMP5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59A52F80255;
	Tue,  8 Dec 2020 15:01:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B251F80253; Tue,  8 Dec 2020 15:01:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from relay-b01.edpnet.be (relay-b01.edpnet.be [212.71.1.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F548F80164
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 15:01:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F548F80164
X-ASG-Debug-ID: 1607436082-0a7ff514a0571250001-UKjUFf
Received: from [192.168.177.53] ([213.219.152.236]) by relay-b01.edpnet.be
 with ESMTP id lak1FieT7Xeo2p3C for <alsa-devel@alsa-project.org>;
 Tue, 08 Dec 2020 15:01:22 +0100 (CET)
X-Barracuda-Envelope-From: janpieter.sollie@kabelmail.de
X-Barracuda-Effective-Source-IP: UNKNOWN[213.219.152.236]
X-Barracuda-Apparent-Source-IP: 213.219.152.236
To: alsa-devel@alsa-project.org
From: Janpieter Sollie <janpieter.sollie@kabelmail.de>
Subject: AMD ACP raven ridge: invalid audio mode 2
Message-ID: <07aae8e3-1ee2-60a9-daee-a0172c1012e7@kabelmail.de>
X-ASG-Orig-Subj: AMD ACP raven ridge: invalid audio mode 2
Date: Tue, 8 Dec 2020 15:01:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Barracuda-Connect: UNKNOWN[213.219.152.236]
X-Barracuda-Start-Time: 1607436082
X-Barracuda-URL: https://212.71.1.221:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 179
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: SPAM GLOBAL 1.0000 1.0000 4.3430
X-Barracuda-Spam-Score: 4.34
X-Barracuda-Spam-Status: No, SCORE=4.34 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.86382
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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

Forwarded from: https://bugzilla.kernel.org/show_bug.cgi?id=208699

Anybody who knows what this "ACP" actually does? what's its use?


Kind regards,


Janpieter Sollie

