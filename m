Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3001C4E6013
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 09:13:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B74291755;
	Thu, 24 Mar 2022 09:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B74291755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648109613;
	bh=C91IBjivuy7No8XVmw53eaQXOtEDLs6QX/ui3ZfS1xw=;
	h=From:To:Subject:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kGC880DvC+7VHzOD+Sjy+cpgmYApB3JcHfE9AYv6RcNvT/mmY2vFo9cdqluUxhLkF
	 xdapweWtv3Xa+0kIuh1xAY2UfM9mALTvpDQTv0rZrujGqKjjKDmLWP5px7uwK/dT2D
	 kNjmRzrsZgl8G+ITBgL0d9UTT3zvGtfJBUm05VQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34ACCF80154;
	Thu, 24 Mar 2022 09:12:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE399F80115; Thu, 24 Mar 2022 09:12:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5EBBF80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 09:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5EBBF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="tUG+jY+M"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220324081216epoutp0237450f68e6b038964af4caf2150aa66b~fQuQ835gw2498924989epoutp02A
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 08:12:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220324081216epoutp0237450f68e6b038964af4caf2150aa66b~fQuQ835gw2498924989epoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648109536;
 bh=Hn6fDrjgatOdtTuNl4H7FSza4vBIbxEaPAbEDYTUuJA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=tUG+jY+MsEpIcgmTuwGjhNlO+MVfczs8gosI2oD1/ZN2NdvN5eYViqRo0+Q8zMCWv
 ukrb9j7otpb8QTtsYuMm2BZt+dFwllR41sqx/7a9RUdurR/a/bD2jpnUI//A6hg7CC
 AmkXTKT4dysxfErBD0GQSBnvu0O2JjvCpRfkEOF8=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20220324081216epcas2p2842b76bb1a3b9d29e5929bea1ea330b3~fQuQawoih1421114211epcas2p2y;
 Thu, 24 Mar 2022 08:12:16 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.90]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4KPHy34bN8z4x9QK; Thu, 24 Mar
 2022 08:12:11 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 4B.CD.16040.8D72C326; Thu, 24 Mar 2022 17:12:08 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20220324081208epcas2p41916730b7e386f24e5548fac53e5bc41~fQuI6e3ip1026310263epcas2p43;
 Thu, 24 Mar 2022 08:12:08 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220324081208epsmtrp1e1e2af473b60794b1741c5800a787f4b~fQuI5lnJw0320903209epsmtrp1W;
 Thu, 24 Mar 2022 08:12:08 +0000 (GMT)
X-AuditID: b6c32a46-bffff70000023ea8-b4-623c27d8d8b9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E7.5E.29871.7D72C326; Thu, 24 Mar 2022 17:12:07 +0900 (KST)
Received: from ubuntu.dsn.sec.samsung.com (unknown [12.36.155.120]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220324081207epsmtip22e77ca89c0a3b32c7d1f2143d34bca8b~fQuIrxBny1278212782epsmtip2i;
 Thu, 24 Mar 2022 08:12:07 +0000 (GMT)
From: Oh Eomji <eomji.oh@samsung.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 0/3] Exynos Usb Audio Offloading Support
Date: Thu, 24 Mar 2022 17:10:41 +0900
Message-Id: <1648109444-196321-1-git-send-email-eomji.oh@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7bCmhe4NdZskg84lshZXLh5isji1fCGT
 RfPi9WwWU34tZba4vGsOm8WBP4vZLDp39bNabPi+ltGBw2PD5yY2j52z7rJ7bFrVyeaxf+4a
 do99b5exefRtWcXosX7LVRaPz5vkAjiism0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUN
 LS3MlRTyEnNTbZVcfAJ03TJzgE5TUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSY
 F+gVJ+YWl+al6+WlllgZGhgYmQIVJmRnLG+/y1gwm6+idcIVtgbGidxdjJwcEgImEnsXLmPu
 YuTiEBLYwSjxaP1eNgjnE6NE18MVrBDON0aJRedeMsK0nLywlAXEFhLYyyjx7wI/RNEPRolP
 p84wgSTYBFQlpi/bDtTAwSEiUCaxbLolSA0zyIon75ayg9QIC1hL3N72mA3EZgGqf7C+BWwo
 r4CrxNKNV9ghlslJ3DzXCXafhMApdoljN5czQSRcJJbcvMACYQtLvDq+BapBSuJlfxuUXSxx
 cMFzNgi7RuLtwVaouLHErGftYMcxC2hKrN+lD2JKCChLHLkFNpFZgE+i4/Bfdogwr0RHmxBE
 o5LEpKZOqAMkJFZ8boKyPSQWXlnOCgmSWInjP68yTWCUnYUwfwEj4ypGsdSC4tz01GKjAiN4
 HCXn525iBCc2LbcdjFPeftA7xMjEwXiIUYKDWUmE9/5l6yQh3pTEyqrUovz4otKc1OJDjKbA
 4JrILCWanA9MrXkl8YYmlgYmZmaG5kamBuZK4rxeKRsShQTSE0tSs1NTC1KLYPqYODilGpj8
 Sue9LHqaocbBNPlLEs9VsTcp90r1JoX9XtBxV51rlbVrVZuzEHve9X/1C/iW/91i0Rvx54Wi
 72SBH4tS3X9nCP3oky502H+m6KGiV+lekyNG5i9nTYvM9EhwCIuo51xhGnCyOcTt4VrGJ6yP
 TkRPnhA4ebZpgNT1ik2Wx9vurp65SGmhaPvWgsvCX3tidTQTEmZYTC/b6DyznFXM88rxxWz/
 wq9P4d7xUoHp9vbu1GWvo98+WZ9UueVervRG1s+z9z+e7vFhsknw47J5j1cpbSiWWrPGeOds
 dhezQ3Lv7mt5Vtz0257I+q1WdUt86eepVsFZ1y5uM0nq0s68Vcp0R62L6azMK8UbzM9jeeSV
 WIozEg21mIuKEwFjSLI/9QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMLMWRmVeSWpSXmKPExsWy7bCSvO51dZskg79zzC2uXDzEZHFq+UIm
 i+bF69kspvxaymxxedccNosDfxazWXTu6me12PB9LaMDh8eGz01sHjtn3WX32LSqk81j/9w1
 7B773i5j8+jbsorRY/2WqywenzfJBXBEcdmkpOZklqUW6dslcGUsb7/LWDCbr6J1whW2BsaJ
 3F2MnBwSAiYSJy8sZQGxhQR2M0qc3ecEEZeQWND1mhnCFpa433KEtYuRC6jmG6PEj4+vwBJs
 AqoS05dtZwSxRQQqJG593c4MUsQssIdRouloM1iRsIC1xO1tj9lAbBaghgfrW8C28Qq4Sizd
 eIUdYoOcxM1zncwTGHkWMDKsYpRMLSjOTc8tNiwwzEst1ytOzC0uzUvXS87P3cQIDjctzR2M
 21d90DvEyMTBeIhRgoNZSYT3/mXrJCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8F7pOxgsJpCeW
 pGanphakFsFkmTg4pRqY+jg8/ySe0de1W1DkFXR3+u9V2rIyVqGaB7oeMVn/u2IokM309EHm
 06L3CkK/79byiW/8sC906nfvTUycc+4FT/jcIfT2bGjirKjHcj75z+cpaEZMzPFbeFPytG5y
 ZPfZgCK1xVdyOG1enexcIXIj7I/P+zWCoslHrl4/6pS0LeDDkpWTBQ/bCjt6x1SIGBXIT1Nb
 vHeK+LkTNUHLjFWzi8UuN9WJ16//Nl21eb2A6JzQk/yuoWKzje/u+5m92lF/ClNpdMItG7fM
 V/NvmacWbL5iNv2icOr5abyhkYkeG2+6Mx5Oy+5lnjrjy/QNHzM/p8utc7svVTpRwC29S2Gz
 YemjDc+n5lk9XtK4Y8Y5JZbijERDLeai4kQAFsS4TaYCAAA=
X-CMS-MailID: 20220324081208epcas2p41916730b7e386f24e5548fac53e5bc41
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220324081208epcas2p41916730b7e386f24e5548fac53e5bc41
References: <CGME20220324081208epcas2p41916730b7e386f24e5548fac53e5bc41@epcas2p4.samsung.com>
Cc: Oh Eomji <eomji.oh@samsung.com>, Pavel Skripkin <paskripkin@gmail.com>,
 alsa-devel@alsa-project.org, open list <linux-kernel@vger.kernel.org>,
 Leon Romanovsky <leon@kernel.org>
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

Exynos uses the usb audio offloading functions to save power consumption
in the usb audio device. The audio control interface is processed in the
existing usb path, and the audio stream interface is processed in the
audio path.

Through communication between AP usb and audio usb f/w, usb audio device
connection information, xhci memory information, etc. are notified to usb
audio f/w so that the abox directly controls xhci transmission.

Vendor's hooking interface is required for this functions. Throught this
interface, information such as usb audio device connection information,
pcm interface information, sample rate setting, xhci memory, full descriptor
of connected device, and setting point can be transmitted to usb audio f/w.

the usb audio f/w can set up and interface, transmit audio data, etc. through
the received information.

This patchset includes the following for using usb audio offloading:
- vendor's hooking interface
- vendor's hooking interface calling point
- user using vendor's hooking interface


Oh Eomji (3):
  sound: usb: Add vendor's hooking interface
  sound: usb: Calling vendor's call-back function within usb audio
    operation.
  sound: usb: Exynos usb audio offloading driver

 sound/usb/Kconfig            |   9 +
 sound/usb/Makefile           |   2 +
 sound/usb/card.c             | 119 +++++++++
 sound/usb/card.h             |  20 ++
 sound/usb/exynos_usb_audio.c | 560 +++++++++++++++++++++++++++++++++++++++++++
 sound/usb/exynos_usb_audio.h | 150 ++++++++++++
 sound/usb/pcm.c              |  37 +++
 sound/usb/stream.c           |   2 +
 sound/usb/usbaudio.h         |  45 ++++
 9 files changed, 944 insertions(+)
 create mode 100644 sound/usb/exynos_usb_audio.c
 create mode 100644 sound/usb/exynos_usb_audio.h

-- 
2.7.4

