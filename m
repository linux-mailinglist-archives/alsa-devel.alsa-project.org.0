Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBEB65E61
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 19:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A447F1673;
	Thu, 11 Jul 2019 19:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A447F1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562865574;
	bh=g4JfdEIvRSbT2bYSl1VzGiagNYSJW9yrL8BrLE80Kmw=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kNVxriaDBdKootnL7+QnN9MeEtZDwRJV41STnhtJnNG3zlTU/RmAt8NSOqLt87Vz2
	 CEqZXkQorcwQLufXXDbAzIkdvYUgiCxtJdBTlkqpZn5K2ErZYktiKZPZOUNgwZDlsm
	 ygnnczxYmPsYtgYoM8utuxFMKv1pdYPyHoIs7m0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04423F80307;
	Thu, 11 Jul 2019 19:17:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ED83F802FB; Thu, 11 Jul 2019 19:17:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51801F800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 19:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51801F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TAL7Q7Ig"
Received: by mail-pg1-x542.google.com with SMTP id i18so3243714pgl.11
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 10:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=I7F5ueyWK2Ezku9M6HsI1DBCxJYJq+OM6Yte6G2+Y0Y=;
 b=TAL7Q7IghRKqWf1ClkAFoTirqeATuA5/2vD/5XkWofRSyEBmfKz24+fm72ANO4jF6o
 OMaq2IsWIliPwiA8T+EmRadZkT/4tDCWl1UGrBPD/4LsCkZe+72GWpXIOtktnXJ0DucT
 X4WUsEUDyuzEclPN9P1L3mbtZlAtbGKAmsnSzXHbHOoB64pISnUwsy1z1Bky7f+dsBzM
 QZU8xmkT55b8L2Zp+2JwfHz25G+Nt1x6eKmQecpTJtVflkZYAdpi8RbtHwlNaKATMqKQ
 qJgaXWevrGsBiHpCR0QgfzGrRQv20ukwV3dqUmfec6AFcsF3dolksLRGNFKXF4TcCxXx
 OY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=I7F5ueyWK2Ezku9M6HsI1DBCxJYJq+OM6Yte6G2+Y0Y=;
 b=cxlsLGY55giHbF0C+kOGMbundlS6WLcQxdapDm4QyYF1vFC5UV2qCd7ItUNcp6EnH0
 VDHAljwPl2EtJ/j6gL7y2pvX/t3NhLi9nbehoC4Vu3aNz8otWbMl0boSlP6myKpe0lVh
 hvqiMyfUo35ZaW9gQ4DkN5f2hRqsE3ZTeOImXtijK03Npbq/Lxk4DM0IktDMVcqpO5kl
 ya+1PTjWS0abrZCbFx7TbXstClIS7/1aBxrLO241qVm/za9i9AT6FOkrzkUwlVnWH6rr
 1pTqP/JA0+/NatzzfxhEypMWSijEqWxKZN57Ijmb49AaB8NQhj63StpVkkBzfkj4PZTi
 SqLQ==
X-Gm-Message-State: APjAAAX1323Hti/XE4YDnxmNRPIEDNc1IitjpwEGlNC+h4kv9OJDUant
 ozjGI9REl2UZ/77GmpftAEsYG6up
X-Google-Smtp-Source: APXvYqzsMTXazZXdWR9xdpQFjX2CHap4g9IL5mR47dq8Wx9KYQKgRoKeDopm65v0KzKTv1Z58+h+PQ==
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr5551602pgq.130.1562865452460; 
 Thu, 11 Jul 2019 10:17:32 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id m31sm6508468pjb.6.2019.07.11.10.17.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 10:17:32 -0700 (PDT)
Date: Thu, 11 Jul 2019 22:47:26 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Allison Randal <allison@lohutok.net>,
 Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Message-ID: <20190711171726.GA4356@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: [alsa-devel] [PATCH] sound: pci: emu10k1: Remove unneeded variable
	"change"
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

fix below issue reported by coccicheck
sound/pci/emu10k1/emu10k1x.c:1077:5-11: Unneeded variable: "change".
Return "0" on line 1092

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/pci/emu10k1/emu10k1x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index 67d6473..9cf8183 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -1074,7 +1074,6 @@ static int snd_emu10k1x_shared_spdif_put(struct snd_kcontrol *kcontrol,
 {
 	struct emu10k1x *emu = snd_kcontrol_chip(kcontrol);
 	unsigned int val;
-	int change = 0;
 
 	val = ucontrol->value.integer.value[0] ;
 
@@ -1089,7 +1088,7 @@ static int snd_emu10k1x_shared_spdif_put(struct snd_kcontrol *kcontrol,
 		snd_emu10k1x_ptr_write(emu, ROUTING, 0, 0x1003F);
 		snd_emu10k1x_gpio_write(emu, 0x1080);
 	}
-	return change;
+	return 0;
 }
 
 static const struct snd_kcontrol_new snd_emu10k1x_shared_spdif =
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
