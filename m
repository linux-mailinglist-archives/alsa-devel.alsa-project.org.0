Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 605EB21386D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 12:10:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B648316E3;
	Fri,  3 Jul 2020 12:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B648316E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593771018;
	bh=dB07U+I3vwWfsNCO5abspnbtSUaxMqiBZwHFe8H7AAs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o+pA7cPyCr2d2m8MsBVtkYsK9BnX5DDUnPt7ujTziJ2JwRmRLv/B67DsCz95NY8rP
	 SL5Pc/RqKUOfLI+8Df5NkRHT5n3L5d0QWDv+OtvMngr/tHhRf3EHBP2SMZIW88X3Bs
	 /bNAnogYG2CBQvX380L22Xb7BcxpvL750sYXcSNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CA72F8025F;
	Fri,  3 Jul 2020 12:08:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A0A1F80217; Fri,  3 Jul 2020 12:08:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BFCDF800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 12:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BFCDF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="WKBYhszX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593770910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dB07U+I3vwWfsNCO5abspnbtSUaxMqiBZwHFe8H7AAs=;
 b=WKBYhszXuUFQ6aami7cpz9fFMNX02fXAN89qrspjLzY3wdH7w+lSxM3b3AUERBNPKafcBD
 fHtt/Iusbo8nGiuzLp09zWqjtfM41NdHD5j+LB4unjoWunQKa5FPZCqc0UDU41IZW3XM5u
 8DdwyxEonF6XzcwGjLBjqfd/zNtWSEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-MMbevm3WOsWvWxohUudSmQ-1; Fri, 03 Jul 2020 06:08:28 -0400
X-MC-Unique: MMbevm3WOsWvWxohUudSmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A66B800C64;
 Fri,  3 Jul 2020 10:08:27 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-45.ams2.redhat.com [10.36.114.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47FE570BAB;
 Fri,  3 Jul 2020 10:08:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v2 0/2] ASoC: rt5670: 2 small cleanups
Date: Fri,  3 Jul 2020 12:08:21 +0200
Message-Id: <20200703100823.258033-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Here is in essence a resend of my 2 cleanup patches for the rt5670 ASoC
codec code, rebased on top of broonie/sound/for-5.9 with
broonie/sound/for-5.8 merged in.

Regards,

Hans

p.s.

I'll also send out the patch improving the comment in
cht_bsw_rt5672.c cht_codec_fixup() which Pierre-Louis requested soon.

