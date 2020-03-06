Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982017BE37
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 14:24:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB8709F6;
	Fri,  6 Mar 2020 14:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB8709F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583501081;
	bh=p653x8nz7lRnYrh5jtzi+j84PN03m5eYA3XbDIzR4PQ=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZD163CXo1G4UCtLCStwio+8edoIUalsPNtutt+ucHkbQiEzuOi58zijGTD8/UeuG/
	 ae/PWmg6x2g1Jkk4ph9u01uhJ6kxPqy5+9qJTrrmdMXcIkXcNbEk1KEfK0LP58uu/F
	 TZAHPaGqK/oFtr2Fn4nBDSPvhiu1h2Y48p9+nfMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCF50F801F5;
	Fri,  6 Mar 2020 14:23:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAC9AF801ED; Fri,  6 Mar 2020 10:17:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BB48F8012D
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 10:17:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BB48F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TEv6du7L"
Received: by mail-vs1-f47.google.com with SMTP id n27so1096145vsa.0
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 01:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LGhMDjOWvVqy3en4f5zpd2CFuF2dQvzJXZuo68PVo68=;
 b=TEv6du7LmSro4O0K/QRqungM4CH+7uEplYSZ/1pGX4DtTkE2WGeUHS0iHkQo28ygjk
 vAOOYwDKP9QmMtLYPi+yjRArE3BHSA1mGuZh0vwZIa7+yh5MHrlDA0i5/zfp5St6EG9X
 pI+jxbA3ZPS5Q8hBwMq7Ihv4S6AyUcnX1Ng6Y/ThgJgC+nYhPQC3uzf6QIV1Vlkl0vsL
 cMOSMLn2s47mDJPl9+q6crjpphhfNYtP0BT3Pa3RDSMPWEKhlVNAUfOEmsne2E2rI2CY
 vSy1idoNUy47uRf/8TByyI9s27bcMYXldkAlSqJLFM0ooBLMsudBmIYGyn4bMFy8szTC
 DxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LGhMDjOWvVqy3en4f5zpd2CFuF2dQvzJXZuo68PVo68=;
 b=AdsS0u37B+YUWnED5gNboDbQSaZEAkxwJoXuVLe2xPZR9NSzpCsj6rGLY04h6+kkbr
 h9LCZvkO9LgziLRfzbXi7RFfCTwQCXQGe6DIk/h1uFr3PW7Y2T4ZejFpZvIWsOGLSd20
 bPcS/q0v6/tW7g0zNzteEN97jHyy33yDBSETAfLuaV471XiZAeRYbx+XiEdJkRP2cdmV
 PPZ2N3elQVj4MDlrG63mR+CvULjpyXQGZzagzVzsmIvw9/y8ZJbwTxwdF/IAk7peJpw1
 WZ0IN8UEpkiHdH68LS8HtE2xMNldS0zbZc6dviwUjU4JT50KMToBPaVufb2KPotaoBEw
 UBmQ==
X-Gm-Message-State: ANhLgQ3Lpc8+vgfK7gYJA720SV6VgUMTlmx1D6eOCJej0d9/aP6kYtOi
 rmZ31IV1ThuV5i12qUG4bI/Aa+cUp7qY5kvp9Eis+hSfezE=
X-Google-Smtp-Source: ADFU+vvnVcjmxjIYlFhfIVJg96atSns8SgJ8VlHSmnFrdr7lqjbUMQbq/3BtVBGcP1ahr9gsaNfpsn04rYJU1AKpORk=
X-Received: by 2002:a05:6102:248:: with SMTP id
 a8mr1622136vsq.140.1583486191452; 
 Fri, 06 Mar 2020 01:16:31 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Dr=2E_Jochen_Bl=C3=B6dorn?= <jochen.bloedorn@gmail.com>
Date: Fri, 6 Mar 2020 10:16:20 +0100
Message-ID: <CAP4Funb-TKgEs4gxRYc5z64+Oxa4E5wmQm0nQQHmTgdSai83ZA@mail.gmail.com>
Subject: strange loopback behaviour seen in alsamixer
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Fri, 06 Mar 2020 14:22:59 +0100
Content-Type: text/plain; charset="UTF-8"
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

hi,
while debugging my sound setup in Xubuntu 18.4, I came up on some strange
behaviour.
Reason for debugging was, I couldn't play rear line input to line output.
To check, if I missed some basic settings I started alsamixer.

As I always do, I toggled each setting, to make sure, that the displayed
status reflects it's actual state. This routine is one relict from my old
windows times :-)

When I applied this method to "loopback", which initially was displayed as
"enabled" ( switch from enabled to disabled and back to enabled), I
instantly got sound output. This can, and must be, reproduced after every
restart of the desktop.

Sorry, if I posted this mail wrong way, wrong place, but I thought, the
observation might be of interest.

Jochen
