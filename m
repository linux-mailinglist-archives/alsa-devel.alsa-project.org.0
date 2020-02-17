Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 446BA160DBF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 09:48:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7F231679;
	Mon, 17 Feb 2020 09:47:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7F231679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581929290;
	bh=EwkXCAUtvPsPPdHl0gk6shQ4J6eHlYZLc4gchodmkA8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DbWXLYraR9ibMGfdIYUa9pU5AUW3XIcQwLihobXi5l0QFe17yVJqoo06tBqB44eNo
	 MFYVzPFg7YADlfNWN+iXcjn5BSbkwq/iGCd8e0cNFHeIUVrAAJUjxm8GWwMsUpz0Q6
	 X4kktiY+ZX1cKXzgZL30QminfVphHV3xXRNVUdL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04A20F800C4;
	Mon, 17 Feb 2020 09:46:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95786F8015E; Mon, 17 Feb 2020 09:46:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C1C6F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 09:46:24 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 28F61A0040
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 09:46:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 28F61A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1581929184; bh=c3hwEU9VSLfhw8DGnSoFCjgg8ok2pzx2RMrvvelTeOA=;
 h=To:From:Subject:Date:From;
 b=aKbDcYgzQ+WWpX55ChgrRBZ1coDnRCwj6EbACfnVUpep+PDZgsLf1WtVXyXd1Ot84
 UMLxnT4FTOK51HmSyPNypUsLNUt6BML3FUpz7No96e1EG62rtkB3txQxfWw0dn73NR
 P6A+5HVk/aRRoyFT40dfu7yIy0QpjYSuuYDaMJPc=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 09:46:23 +0100 (CET)
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <77884bad-81fd-f876-3f72-1f96a39d6329@perex.cz>
Date: Mon, 17 Feb 2020 09:46:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [alsa-devel] DMARC & gmail & cirrus.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

	today, all gmail users were unsubscribed from the mailing list, because we 
have users who sends e-mails from domains with the DMARC policy reject (like 
cirrus.com). The mailman counts those bounces and unsubscribe users who do not 
receive those e-mails. The nice explanation is here:

https://www.linuxchix.org/content/mailing-list-changes

	I can enable the "Replace the From: header address" in the mailman config to 
"Munge From" like in the above example, but it will mean that From: will be 
altered (see the explanation).

	Another option is to disable the bounce check in mailman, but it will cause 
that the "dead" subscribers are not detected anymore.

	Any opinions on this?

					Jaroslav

SMTP error:

(host alt1.gmail-smtp-in.l.google.com[173.194.73.26] said: 550-5.7.26 
Unauthenticated email from cirrus.com is not accepted due to domain's 
550-5.7.26 DMARC policy. Please contact the administrator of cirrus.com domain 
550-5.7.26 if this was a legitimate mail. Please visit 550-5.7.26 
https://support.google.com/mail/answer/2451690 to learn about the 450 4.7.26 
DMARC initiative. m14si10079981ljg.84 - gsmtp (in reply to end of DATA command))

DMARC settings for cirrus.com:

v=DMARC1; p=reject; 
fo=1;rua=mailto:dmarc_rua@emaildefense.proofpoint.com;ruf=mailto:dmarc_ruf@emaildefense.proofpoint.com

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
