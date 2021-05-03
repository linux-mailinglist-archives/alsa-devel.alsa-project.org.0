Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B50372212
	for <lists+alsa-devel@lfdr.de>; Mon,  3 May 2021 22:54:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42E0B1693;
	Mon,  3 May 2021 22:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42E0B1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620075253;
	bh=1ABttYPlQ9b35M7L5xDzTejIJ2yXN9f0ebgzRb12UKA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FQ0GqjM4oC+PYYJNmkW+QL2dZ+NA4xOtBNxLHrd4sHA/e0db1ywzGzuO571uGZDxy
	 wdEsM5Xc/eLyqovBa0i34REk6pTO2b0bbJMhfQKlVbPQschkmmhj7NiStDvDpYSBJ9
	 e5p6T9DBBZPK1U6pvI5MhgdwVQegkEsVuIrl9/1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C011F8026A;
	Mon,  3 May 2021 22:52:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09938F80162; Mon,  3 May 2021 22:52:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C3F5F80162
 for <alsa-devel@alsa-project.org>; Mon,  3 May 2021 22:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C3F5F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="YoEHO5Q/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620075157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NSzKqg5t3czdKenVTRL7PFMFxY9mTvRA/jeT2jKZuCc=;
 b=YoEHO5Q/mWSy3dWQ+GYNTEA//zkrKgPmixsHik35zLPLoEqB9Ki065huu/eRd8oBfYsr2W
 FzG8bmE1k6olKRobv7peb9qeg28KtgT7I2QpKV5vqm0iKJDWFEgOg9Qr7huNCkbASRp3je
 fJKR3IlsmyS4f7vsCYl9HD4vuoGYCEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-d_fy-xdyPzqrq5nWLU6XgQ-1; Mon, 03 May 2021 16:52:35 -0400
X-MC-Unique: d_fy-xdyPzqrq5nWLU6XgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 483AA800D62;
 Mon,  3 May 2021 20:52:34 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56C8A5C1C2;
 Mon,  3 May 2021 20:52:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 0/5] Add generic exception mechanism for non-standard
 control-names
Date: Mon,  3 May 2021 22:52:26 +0200
Message-Id: <20210503205231.167346-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>
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

Hi All,

This series seems to have fallen through the cracks,
so here is a resend of it.

Regards,

Hans


Hans de Goede (5):
  mixer: simple - Add generic exception mechanism for non-standard
    control-names
  mixer: simple - Move handling of 3D Control - Depth controls to the
    exceptions list
  mixer: simple - Add exceptions for non " Volume" suffixed capture
    vol-ctls used in ASoC realtek codec drivers
  mixer: simple - Add exceptions for some capture-vol-ctls which have a
    " Volume" suffix
  mixer: simple - Add exceptions for some Playback Switches with a "
    Channel Switch" suffix

 src/mixer/simple_none.c | 74 +++++++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 28 deletions(-)

-- 
2.31.1

