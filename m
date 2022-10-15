Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5B35FFDFC
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 09:34:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 707FD7522;
	Sun, 16 Oct 2022 09:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 707FD7522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665905699;
	bh=bkT6SjV4/UyDaGXq+jP0PfW64nl6qjIq+BQVyPY1/kw=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fS6D/SmAfviCA3kHpnQ0DvIVvOhwK1J3zPIFSyI6yPXqeNarBq4Qr3tBTKiT0GXt0
	 TCPFRubryeMsTdrw+flfrTH2+HGbKaQQitaAxOv+YkXxbx+3mvYuu+q4T4XLdcB2nn
	 e9dRkgzkkDbkGrlGmQJU/tte5v0OqIgAETylebKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E283F805CB;
	Sun, 16 Oct 2022 09:28:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E83AEF801F7; Sat, 15 Oct 2022 16:56:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=HEXHASH_WORD,HTML_MESSAGE,
 KHOP_HELO_FCRDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from tau07.net (svr01.tau07.net [62.112.43.237])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F142F800C1
 for <alsa-devel@alsa-project.org>; Sat, 15 Oct 2022 16:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F142F800C1
Received: from localhost (localhost [127.0.0.1])
 by tau07.net (Postfix) with ESMTP id 94A7C68005E;
 Sat, 15 Oct 2022 16:56:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at taujhe.de
Received: from tau07.net ([127.0.0.1])
 by localhost (srv01.tau07.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idnl3dPwpGIP; Sat, 15 Oct 2022 16:56:27 +0200 (CEST)
Received: from [IPV6:2003:f8:7706:8101:794f:8a7e:1941:4f5c]
 (p200300f877068101794f8a7e19414f5c.dip0.t-ipconnect.de
 [IPv6:2003:f8:7706:8101:794f:8a7e:1941:4f5c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: jan)
 by tau07.net (Postfix) with ESMTPSA id 0ED8B680043;
 Sat, 15 Oct 2022 16:56:27 +0200 (CEST)
Message-ID: <53ac9cce-51bf-100a-fa61-0dff6acd3a2d@taujhe.de>
Date: Sat, 15 Oct 2022 16:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: de-DE, en-GB
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Jan Henke <Jan.Henke@taujhe.de>
Subject: Regression in Linux Kernel v5.15.71 / external headset microphone
 stops working
X-Mailman-Approved-At: Sun, 16 Oct 2022 09:28:43 +0200
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hello sound system maintainers,

a recent patch to the stable 5.15 linux branch unfortunately introduced 
a regression. From 5.15.71 onward (also in 5.19.15) plugging in an 
external headset into the audio jack no longer results in a working 
microphone. Symptoms are that there is no choice to set the connected 
device to microphone only (I am using GNOME, so once you plugin a device 
you get a dialogue to choose it's type, normally there are 3 choices, 
Headphone, Headset and Microphone, with the bug the last one is 
missing), and the connected microphone no longer records any audio. Note 
that you can still choose the headset microphone as audio input, it just 
does not record anything.

Doing a git bisect I was able to identify the commit introducing this 
regression:

a963fe6d0eb6ef0a15b3aade7c186cd5bb7bd01f is the first bad commit
commit a963fe6d0eb6ef0a15b3aade7c186cd5bb7bd01f
Author: Callum Osmotherly <callum.osmotherly@gmail.com>
Date:   Thu Sep 15 22:36:08 2022 +0930

     ALSA: hda/realtek: Enable 4-speaker output Dell Precision 5530 laptop
     
     commit 1885ff13d4c42910b37a0e3f7c2f182520f4eed1 upstream.
     
     Just as with the 5570 (and the other Dell laptops), this enables the two
     subwoofer speakers on the Dell Precision 5530 together with the main
     ones, significantly increasing the audio quality. I've tested this
     myself on a 5530 and can confirm it's working as expected.
     
     Signed-off-by: Callum Osmotherly <callum.osmotherly@gmail.com>
     Cc: <stable@vger.kernel.org>
     Link:https://lore.kernel.org/r/YyMjQO3mhyXlMbCf@piranha
     Signed-off-by: Takashi Iwai <tiwai@suse.de>
     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

  sound/pci/hda/patch_realtek.c | 1 +
  1 file changed, 1 insertion(+)

Which makes sense, since I noticed this regression on a Dell Precision 
5530 laptop.

Downstream bug report: https://bugs.gentoo.org/876843

Please revert this commit to restore the previous working condition on 
all affected branches, since an external headset is a very common use 
case with these kinds of laptops. There were similar commits for 
different laptop models, but I do not have any of these models, so I 
cannot say if they cause a similar regression.

Best regards,
Jan Henke
