Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 942913406A
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 09:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23E401662;
	Tue,  4 Jun 2019 09:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23E401662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559633879;
	bh=4FVHYpFu8jAYnFKNnSZtPMwCEYtx/tJz47cGW226WwU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CRBfSQdMv1XVT547LDo1dRHeIXkXbZAXHx+yobh8uId0fisboYOPIDUEE27Be4dEn
	 ZY3cNo1uFMC8pkwybSdDf8qB1JzeNIC8tGiBX/qvtLCfmJDfCSfdc94oXLzq6IC8tw
	 No1Y827wZxaBkwO2Z0ay5DwfqIoIxP0roXkmNgII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F187F89738;
	Tue,  4 Jun 2019 09:35:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58281F89736; Tue,  4 Jun 2019 09:35:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED0BFF896F7
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 09:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED0BFF896F7
Received: by mail-lf1-f66.google.com with SMTP id y13so15627214lfh.9
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 00:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ObbNbZR/72D98Vc550uzYyGenM0+DWmngeVzeXEi0ZM=;
 b=hnxSNoPSOu7QPB1O3oH8K1P/ZWu3QjboVR8AHDxQlATYsAooL6538ix6yH9IKkkx8R
 3CtrhoJGOCc47fiCnyjcj3DyTPNHISZXwbo75ke0O10RGp27YXEt/GC+9hTNSYdshejB
 3z1IZyBHPzG7hTiirTab6W5oS5p1YmubGqfijYKiYgRU+yQV+kvjphBWIYZ+Pw6lPnLk
 hvnfpQVvXux/yU/g9AASua1WmAo+QQFAPSy/qIIY3RjxdHbpL5iy8IVUVv7g4f74S75D
 60l3YC4Zc2ZS6d0hO9TuB1iMHRUUGWFi+KFfN485K86bbt2eTDL1Gm3mbXnO7VCZV7yN
 Olmw==
X-Gm-Message-State: APjAAAV/u3FKwj0mRyThb2Tfmt9tUkw769VSMfL8SFfhjxKRtDdyCE4r
 Stu5olOhtGwH3T9i4g5rlCTirzKWez8KTZIgfPk=
X-Google-Smtp-Source: APXvYqzZy7bAsh6aATIcduZ/ydlM1aKS4jqm+mf9GX84nUleah+LyhiDwD0TYIniqNJly32Ees0tY+eMT6LcuMOqD9Q=
X-Received: by 2002:a19:c142:: with SMTP id r63mr17039438lff.49.1559633729962; 
 Tue, 04 Jun 2019 00:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-3-geert@linux-m68k.org>
 <15499.1559298884@warthog.procyon.org.uk>
 <CAMuHMdX57DKCMpLXdtZPE-w0esUNVv9-SwYjmT5=m+u9ryAiHQ@mail.gmail.com>
 <9306.1559633653@warthog.procyon.org.uk>
In-Reply-To: <9306.1559633653@warthog.procyon.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2019 09:35:16 +0200
Message-ID: <CAMuHMdXOikfh56DAHGpNUoRefbhYSbh=VK3J8EzZCXVLqZtEVw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-afs@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, "David S . Miller" <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Clemens Ladisch <clemens@ladisch.de>, Jamal Hadi Salim <jhs@mojatatu.com>,
 linux-block@vger.kernel.org, Jiri Pirko <jiri@mellanox.com>,
 Cong Wang <xiyou.wangcong@gmail.com>, Joe Perches <joe@perches.com>,
 "Mohit P . Tahiliani" <tahiliani@nitk.edu.in>,
 Matias Bjorling <mb@lightnvm.io>, Eran Ben Elisha <eranbe@mellanox.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Igor Konopko <igor.j.konopko@intel.com>
Subject: Re: [alsa-devel] [PATCH] rxrpc: Fix uninitialized error code in
	rxrpc_send_data_packet()
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

Hi David,

On Tue, Jun 4, 2019 at 9:34 AM David Howells <dhowells@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > I'm not such a big fan of BUG(), so I'd go for ret = -EAFNOSUPPORT, but given
> > rxrpc is already full of BUG() calls, I guess it is an acceptable solution.
>
> Okay.  Are you okay with this going through net-next?

Yes, I am.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
