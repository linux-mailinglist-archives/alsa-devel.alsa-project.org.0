Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D29F1A6372
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 09:16:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDD6A16DB;
	Mon, 13 Apr 2020 09:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDD6A16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586762207;
	bh=6b3h8AzJGWZ1ZJFlRphzRsVYeQCV2003KdeHiG4hzg8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KKu2WUQ5eBQOQxpI/B15Y5lgrOG2LNb5tqCBOfl4DLDSWpfGSAlrzzN360CSHjiQH
	 DsniSJMJz5nUGdImlMJ4rQm23EJz6DXPasv8HBbklSV0k+IQRBjVKP34cYwGyllZ50
	 QXhvj8K+lKJeWhZSAAXa92oTPKuQ+53eYcBizOFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D40BEF80115;
	Mon, 13 Apr 2020 09:15:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37D5FF80245; Mon, 13 Apr 2020 09:15:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 72767F80115
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 09:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72767F80115
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1586762099508881092-webhooks-bot@alsa-project.org>
References: <1586762099508881092-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: seq: tstamp: use wrapper structure instead of union
Message-Id: <20200413071504.37D5FF80245@alsa1.perex.cz>
Date: Mon, 13 Apr 2020 09:15:04 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #17 was opened from takaswie:

In UAPI for ALSA Sequencer, snd_seq_timestamp is union with
snd_seq_tick_time_t and struct snd_seq_real_time types. The
libalsaseq has GLib Boxed object for the union, named as
ALSASeqTstamp.

```
$ cat build/src/seq/ALSASeq-0.0.gir
    ...
    <union name="Tstamp"
           c:type="ALSASeqTstamp"
           glib:type-name="ALSASeqTstamp"
           glib:get-type="alsaseq_tstamp_get_type"
           c:symbol-prefix="tstamp">
      <source-position filename="../src/seq/tstamp.h" line="14"/>
      ...
    </union>
    ...
```

Although this is valid in a view of GObject
Introspection, it's not necessarily convenient to language
bindings because some programming language doesn't support
union type. In this case, the type is not available.

This commit adds an alternative structure to wrap the union.
As a result, ALSASeqTstamp is GLib Boxed object for the
wrapper structure.

```
$ cat build/src/seq/ALSASeq-0.0.gir
    ...
    <record name="Tstamp"
            c:type="ALSASeqTstamp"
            glib:type-name="ALSASeqTstamp"
            glib:get-type="alsaseq_tstamp_get_type"
            c:symbol-prefix="tstamp">
      <source-position filename="../src/seq/tstamp.h" line="18"/>
      <field name="tstamp" writable="1">
        <type name="gpointer" c:type="snd_seq_timestamp"/>
      </field>
      ...
    </record>
    ...
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/17
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/17.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
